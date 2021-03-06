//
//  BaseViewModel.m
//  ProjectTemple
//
//  Created by mac on 14/11/18.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseViewModel ()
{
    PTHTTPRequestManager * _requestManager;
}
@end

@implementation BaseViewModel

-(instancetype) init
{
    self =[super init];
    if(self)
    {
        @weakify(self);
        self.contentTypeSignal = [RACObserve(self, contentType)  doNext:^(id x) {
            @strongify(self);
            StatusNotificationViewType type = [x integerValue];
            if(type == kSNNoNetwork)
            {
                self.emptyDataSetEntity = [self emptyDataSetEntityWhenNoNetwork];
            }
            else if(type == kSNNoData)
            {
                self.emptyDataSetEntity = [self emptyDataSetEntityWhenNoData];
            }
            else if(type == kSNNoDataLoading)
            {
                self.emptyDataSetEntity = [self emptyDataSetEntityWhenLoading];
            }
            
        }];
        
        
        RACSignal * requestDataSource = [self.requestManager rac_GET:self.requestURLPath parameters:self.requestParameters];
        self.requestDataSource = [requestDataSource  catch:^RACSignal *(NSError *error) {
            
            @strongify(self);
            if(error.code == NSURLErrorNotConnectedToInternet)
            {
                self.contentType=kSNNoNetwork;
            }
            else
            {
                self.contentType=kSNNoData;
            }
            
            return [RACSignal empty];
            
        }];
    }
    
    return self;
}



//HTTP request
-(PTHTTPRequestManager*) requestManager
{
    if(!_requestManager)
    {
        _requestManager=[[PTHTTPRequestManager alloc] init];
    }
    
    return  _requestManager;
}



#pragma mark - Override method 
- (DZNEmptyEntity *) emptyDataSetEntityWhenNoNetwork
{
    DZNEmptyEntity * emptyNoNetwork = [[DZNEmptyEntity alloc] init];
    emptyNoNetwork.title= [[NSAttributedString alloc] initWithString:@"no network"];
    emptyNoNetwork.emptyDescription= [[NSAttributedString alloc] initWithString:@"no network"];
    return emptyNoNetwork;
}

- (DZNEmptyEntity *) emptyDataSetEntityWhenNoData
{
    DZNEmptyEntity * emptyNoData = [[DZNEmptyEntity alloc] init];
    emptyNoData.title= [[NSAttributedString alloc] initWithString:@"no data"];
    emptyNoData.emptyDescription= [[NSAttributedString alloc] initWithString:@"no data"];
    return emptyNoData;
}

- (DZNEmptyEntity *) emptyDataSetEntityWhenLoading
{
    DZNEmptyEntity * emptyNoData = [[DZNEmptyEntity alloc] init];
    emptyNoData.title= [[NSAttributedString alloc] initWithString:@"loading data"];
    emptyNoData.emptyDescription= [[NSAttributedString alloc] initWithString:@"loading data"];
    return emptyNoData;
}

@end
