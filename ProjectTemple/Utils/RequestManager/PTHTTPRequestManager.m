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
-(void) globalConfig;
@end


@implementation PTHTTPRequestManager

- (instancetype)init
{
    self = [super  initWithBaseURL:URL(BASE_HOME_URL)];
    if (self) {
        
        [self configEffect];
    }
    return self;
}

+(instancetype) requestManager
{
    PTHTTPRequestManager * mgr =[[[self class] alloc] init];
    return mgr;
}


#pragma mark - private method
-(void) handleCompletionWithResponse:(OVCResponse*) response  error:(NSError*) error  completeBlock:(PTRequestCompleteBlock) completeBlock   failureBlock:(PTRequestFailedBlock) failureBlock
{
    if (error) {
        failureBlock(error);
    }
    else
    {
        completeBlock((PTResponse *)response);
    }
}


-(void) configEffect
{
    [self globalConfig];
}

-(void) restoreState
{
    // restore time out interval
    self.requestSerializer.timeoutInterval=TIME_OUT_INTERVAL;
}


#pragma mark - request method

-(AFHTTPRequestOperation *) GET:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation= [self GET:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    [self restoreState];
    
    return requestOperation;
}


-(AFHTTPRequestOperation *) HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self HEAD:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    [self restoreState];
    
    return requestOperation;
}


-(AFHTTPRequestOperation *) POST:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self POST:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    [self restoreState];
    
    return requestOperation;
}

-(AFHTTPRequestOperation *) POST:(NSString *)URLString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self POST:URLString parameters:parameters constructingBodyWithBlock:block completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    [self restoreState];
    
    return requestOperation;
}

-(AFHTTPRequestOperation *) PUT:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self PUT:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    [self restoreState];
    
    return requestOperation;
}

-(AFHTTPRequestOperation *) PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self PATCH:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
        [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    [self restoreState];
    
    return requestOperation;
}

-(AFHTTPRequestOperation *) DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock)completeBlock failure:(PTRequestFailedBlock)failureBlock
{
    AFHTTPRequestOperation * requestOperation=[self DELETE:URLString parameters:parameters completion:^(OVCResponse *response, NSError *error) {
       [self handleCompletionWithResponse:response error:error completeBlock:completeBlock failureBlock:failureBlock];
    }];
    
    [self restoreState];
    
    return requestOperation;
}


#pragma mark - cancel request method

-(void) cancelAll
{
    [self cancelAllRequests];
}


#pragma mark - time interval 
-(void) setCurrentRequestTimeoutInterval:(NSTimeInterval)interval
{
    self.requestSerializer.timeoutInterval=interval;
}

@end
