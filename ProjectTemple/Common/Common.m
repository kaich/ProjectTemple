//
//  Common.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "Common.h"

#import <AFNetworkReachabilityManager.h>

@implementation Common

+ (instancetype)sharedInstance {
    static Common *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[Common alloc] init];
    });
    
    return _sharedInstance;
}


#pragma mark - Property Method

-(PTNetworkReachabilityStatus) networkStatus
{
   return  (int)[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
}

@end
