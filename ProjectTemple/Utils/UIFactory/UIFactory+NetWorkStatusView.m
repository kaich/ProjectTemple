//
//  UIFactory+NetWorkStatusView.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIFactory+NetWorkStatusView.h"

@implementation UIFactory (NetWorkStatusView)

+(UIImageView*) createNetWorkStatusViewWithNetWorkStatus:(PTNetworkReachabilityStatus ) status
{
    switch (status) {
        case PTNetworkReachabilityStatusNotReachable:
        {
            
        }
            break;
        case PTNetworkReachabilityStatusReachableViaWWAN:
        {
            
        }
            break;
        case PTNetworkReachabilityStatusUnknown:
        {
            
        }
            break;
        case PTNetworkReachabilityStatusReachableViaWiFi:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    return  nil;
}

@end
