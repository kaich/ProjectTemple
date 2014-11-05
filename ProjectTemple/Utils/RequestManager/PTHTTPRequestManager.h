//
//  PTRequestManager.h
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^PTRequestCompleteBlock)(NSArray * results);
typedef void(^PTRequestFailedBlock)(NSError * error);

@interface PTHTTPRequestManager : NSObject

@property(nonatomic,copy) PTRequestCompleteBlock completionBlock;
@property(nonatomic,copy) PTRequestFailedBlock   failureBlock;


/**
 *  get request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 *  head request  only request Head
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (void)HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 *  post request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 *  post request
 *
 *  @param URLString  path
 *  @param parameters params
 *  @param block      A block that takes a single argument and appends data to the HTTP body. The block argument is an object adopting the `AFMultipartFormData` protocol.
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block;

/**
 *  PUT request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (void)PUT:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 *  PATCH request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (void)PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 *  DELETE request
 *
 *  @param URLString  path
 *  @param parameters params
 */
- (void)DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters;

/**
 *  cancel last request
 */
-(void) cancelLastRequest;

/**
 *  only retain  count of request last, others all be canceld
 *
 *  @param count
 */
-(void) cancelAllBeforeLastCount:(NSInteger) count;

/**
 *  cancel all request
 */
-(void) cancelAll;

@end
