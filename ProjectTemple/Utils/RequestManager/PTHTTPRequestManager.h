//
//  PTRequestManager.h
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "PTError.h"

typedef void(^PTRequestCompleteBlock)(NSArray * results);
typedef void(^PTRequestFailedBlock)(PTError * error);

@interface PTHTTPRequestManager : NSObject


/**
 *  get request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (AFHTTPRequestOperation *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock) completeBlock failure:(PTRequestFailedBlock) failureBlock;

/**
 *  head request  only request Head
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (AFHTTPRequestOperation *)HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock) completeBlock failure:(PTRequestFailedBlock) failureBlock;

/**
 *  post request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (AFHTTPRequestOperation *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock) completeBlock failure:(PTRequestFailedBlock) failureBlock;

/**
 *  post request
 *
 *  @param URLString  path
 *  @param parameters params
 *  @param block      A block that takes a single argument and appends data to the HTTP body. The block argument is an object adopting the `AFMultipartFormData` protocol.
 */
- (AFHTTPRequestOperation *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block completion:(PTRequestCompleteBlock) completeBlock failure:(PTRequestFailedBlock) failureBlock;

/**
 *  PUT request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (AFHTTPRequestOperation *)PUT:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock) completeBlock failure:(PTRequestFailedBlock) failureBlock;

/**
 *  PATCH request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (AFHTTPRequestOperation *)PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock) completeBlock failure:(PTRequestFailedBlock) failureBlock;

/**
 *  DELETE request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (AFHTTPRequestOperation *)DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters completion:(PTRequestCompleteBlock) completeBlock failure:(PTRequestFailedBlock) failureBlock;

/**
 *  cancel all request
 */
-(void) cancelAll;

/**
 *  set current request time out interval .  the time out interval only effect current request;
 *
 *  @param interval
 */
-(void) setCurrentRequestTimeoutInterval:(NSTimeInterval) interval;

@end
