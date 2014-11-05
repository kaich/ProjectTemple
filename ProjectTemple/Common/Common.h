//
//  Common.h
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PTNetworkReachabilityStatus) {
    PTNetworkReachabilityStatusUnknown          = -1,
    PTNetworkReachabilityStatusNotReachable     = 0,
    PTNetworkReachabilityStatusReachableViaWWAN = 1,
    PTNetworkReachabilityStatusReachableViaWiFi = 2,
};

@interface Common : NSObject

/**
 *  NETWORK Status
 */
@property(nonatomic,assign,readonly) PTNetworkReachabilityStatus networkStatus;

/**
 *  singleton method
 *
 *  @return instance
 */
+ (instancetype)sharedInstance;

@end
