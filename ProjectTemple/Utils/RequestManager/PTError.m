//
//  PTError.m
//  ProjectTemple
//
//  Created by mac on 14/11/6.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "PTError.h"

@implementation PTError


+(PTError *) networkError
{
    PTError * error =[[PTError alloc] init];
    error.networkStatus=COMMON.networkStatus;
    switch (COMMON.networkStatus) {
        case PTNetworkReachabilityStatusNotReachable:
        {
            error.message=REQUEST_NO_NETWORK_MESSAGE;
        }
            break;
        case PTNetworkReachabilityStatusUnknown:
        {
            error.message=REQUEST_UNKNOW_ERROR_MESSAGE;
        }
            break;
            
        default:
            break;
    }
    
    return error;
}


+(PTError *) timeOutError
{
    PTError * error =[[PTError alloc] init];
    error.networkStatus=COMMON.networkStatus;
    error.message=REQUEST_TIME_OUT_MESSAGE;
    
    return error;
}

@end
