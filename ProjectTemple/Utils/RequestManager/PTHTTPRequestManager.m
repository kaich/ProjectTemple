//
//  PTRequestManager.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "PTHTTPRequestManager.h"
#import "PTHTTPRequestBaseManager.h"

@interface PTHTTPRequestManager ()
@property(nonatomic,strong) PTHTTPRequestBaseManager *  requestManager;
@end

@implementation PTHTTPRequestManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requestManager=[[PTHTTPRequestBaseManager alloc] initWithBaseURL:URL(BaseHomeURL)];
    }
    return self;
}


#pragma mark - request method

-(void) GET:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    [self.requestManager GET:URLString parameters:parameters completion:^(id response, NSError *error) {
        if (error) {
            failureBlock(error);
        }
        else
        {
            NSArray * results=
        }
    }]
}

@end
