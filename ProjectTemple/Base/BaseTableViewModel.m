//
//  BaseTableViewModel.m
//  ProjectTemple
//
//  Created by mac on 14/11/19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface BaseTableViewModel ()
@property(nonatomic,strong) NSArray * dataSource;
@property(nonatomic,assign) NSInteger  pageIndex;
@end

@implementation BaseTableViewModel

-(instancetype) init
{
    self =[super init];
    if(self)
    {
        
        //initialize property
        _pageIndex =0;
        _countPerPage=COUNT_PER_PAGE;
        self.contentType =kSNNoLoading;
        
        [self configRequestDataSource];
    }
    
    return  self;
}


-(void) configRequestDataSource
{
    self.requestURLPath=[self requestURLPath];
    self.parameters =[self requestParameters];
    
    if(self.requestURLPath)
    {
        
        RACSignal * requestDataSource = [self.requestManager rac_GET:self.requestURLPath parameters:self.parameters];
        
        @weakify(self);
        void (^sendRequest)() =^(){
            [[requestDataSource  catch:^RACSignal *(NSError *error) {
                
                @strongify(self);
                if(error)
                    self.contentType=kSNNoData;
                return [RACSignal empty];
                
            }] subscribeNext:^(PTResponse * response) {
                
                @strongify(self);
                if([response.result isKindOfClass:[NSArray class]])
                {
                    NSArray * results=response.result;
                    if(self.pageIndex == PAGE_START_INDEX)
                        self.dataSource = [results mutableCopy];
                    else
                    {
                        NSMutableArray * newDatasource =[self.dataSource mutableCopy];
                        [newDatasource addObjectsFromArray:results];
                        self.dataSource = newDatasource;
                    }
                    if(self.dataSource.count ==0)
                        self.contentType=kSNNoData;
                    if(results.count==0)
                        self.contentType=kSNNoMoreData;
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
