//
//  BaseTableViewModel.m
//  ProjectTemple
//
//  Created by mac on 14/11/19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface BaseTableViewModel ()
@property(nonatomic,assign) NSInteger  pageIndex;
@end

@implementation BaseTableViewModel
@dynamic refreshDataSource;

-(instancetype) init
{
    self =[super init];
    if(self)
    {
        
        //initialize property
        _pageIndex =0;
        _countPerPage=COUNT_PER_PAGE;
        self.contentType =kSNNoDataLoading;
        [self configRequestDataSource];
    }
    
    return  self;
}


-(void) configRequestDataSource
{
    
    if(self.requestURLPath)
    {
        
        RACSignal * requestDataSource = [self.requestManager rac_GET:self.requestURLPath parameters:self.requestParameters];
        self.requestDataSource = requestDataSource;
        
        @weakify(self);
        void (^sendRequest)() =^(){
            [self configRequestManagerBeforeSend];
            self.requestDataSource = [requestDataSource  catch:^RACSignal *(NSError *error) {
                
                @strongify(self);
                if(error.code == NSURLErrorNotConnectedToInternet)
                {
                    self.contentType=kSNNoNetwork;
                }
                else if(self.pageIndex == PAGE_START_INDEX)
                {
                    self.contentType=kSNNoData;
                }
                else
                {
                    self.contentType=kSNNoMoreData;
                }
                
                return [RACSignal empty];
                
            }];
                                      
            [self.requestDataSource subscribeNext:^(PTResponse * response) {
                
                @strongify(self);
                if([response.result isKindOfClass:[NSArray class]])
                {
                    NSArray * results=response.result;
                    if(self.pageIndex == PAGE_START_INDEX)
                    {
                        self.tableViewModel = [[NIMutableTableViewModel alloc] initWithDelegate:(id)[NICellFactory class]];
                    }
                    
                    [self.tableViewModel addObjectsFromArray:results];
                    
                    if(self.pageIndex == PAGE_START_INDEX && results.count == 0)
                        self.contentType=kSNNoData;
                    if(results.count==0)
                        self.contentType=kSNNoMoreData;
                    
                    self.dataSourceChanged = !_dataSourceChanged;
                }
                
            }];
        };
        

                                        
               
        self.refreshDataSource = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            self.pageIndex = PAGE_START_INDEX;
            sendRequest();
            return [RACSignal empty];
        }];
        
        
        self.inflineRequestDataSource = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            self.pageIndex  ++ ;
            sendRequest();
            return  [RACSignal empty];
        }];
    }
    else
    {
        THROW_EXCEPTION(@"url error", @"request url path is nil!");
    }
}


#pragma mark - Overide Method

-(NSString*) requestURLPath
{
    THROW_EXCEPTION(@"invoke error", @"you must overide requestURLPath method");
}

-(NSDictionary*) requestParameters
{
    THROW_EXCEPTION(@"invoke error", @"you must overide requestParameters method");
}


@end
