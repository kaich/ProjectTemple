//
//  PTRequestManager.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "PTHTTPRequestManager.h"
#import "PTHTTPRequestBaseManager.h"


@interface PTHTTPRequestBaseManager ()
-(NSDictionary *) globalConfig;
@end

@interface PTHTTPRequestManager ()
@property(nonatomic,strong) PTHTTPRequestBaseManager *  requestManager;
@end

@implementation PTHTTPRequestManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requestManager=[[PTHTTPRequestBaseManager alloc] initWithBaseURL:URL(BASE_HOME_URL)];
        [self configEffect];
    }
    return self;
}


#pragma mark - private method
-(void) handleCompletionWithResponse:(OVCResponse*) response  error:(NSError*) error  completeBlock:(PTRequestCompleteBlock) completeBlock   failureBlock:(PTRequestFailedBlock) failureBlock
{
    if (error) {
        PTError * error =[PTError networkError];
        failureBlock(error);
    }
    else
    {
        NSArray * results=response.result;
        completeBlock(results);
    }
}


-(void) configEffect
{
    [self.requestManager globalConfig];
}

-(void) restoreState
{
    // restore time out interval
    CONFIG_SET(self.requestManager.requestSerializer.timeoutInterval, in)
}


#pragma mark - request method

-(AFHTTPRequestOperation *) GET:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation= [self.requestManager GET:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    return requestOperation;
}


-(AFHTTPRequestOperation *) HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self.requestManager HEAD:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    return requestOperation;
}


-(AFHTTPRequestOperation *) POST:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self.requestManager POST:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    return requestOperation;
}

-(AFHTTPRequestOperation *) POST:(NSString *)URLString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self.requestManager POST:URLString parameters:parameters constructingBodyWithBlock:block completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    return requestOperation;
}

-(AFHTTPRequestOperation *) PUT:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self.requestManager PUT:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    return requestOperation;
}

-(AFHTTPRequestOperation *) PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self.requestManager PATCH:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    return requestOperation;
}

-(AFHTTPRequestOperation *) DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self.requestManager DELETE:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
       [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    return requestOperation;
}


#pragma mark - cancel request method

-(void) cancelAll
{
    [self.requestManager cancelAllRequests];
}


#pragma mark - time interval 
-(void) setCurrentRequestTimeoutInterval:(NSTimeInterval)interval
{
    self.requestManager.requestSerializer.timeoutInterval=interval;
}

@end
