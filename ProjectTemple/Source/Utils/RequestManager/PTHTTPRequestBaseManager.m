//
//  PTHTTPRequestBaseManager.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "PTHTTPRequestBaseManager.h"
#import <Overcoat.h>
#import <ReactiveCocoa.h>
#import "PTResponse.h"

@implementation PTHTTPRequestBaseManager

+(Class) responseClass
{
    return [PTResponse class];
}


+ (NSDictionary *)modelClassesByResourcePath {
#warning 等待实现
    return @{
              @"lookup":  NSClassFromString(@"CKAppleItemModel"),
              @"gift_msgs.action" : NSClassFromString(@"NotificationEntity"),
             };
}


-(void) globalConfig
{
    self.requestSerializer.timeoutInterval=TIME_OUT_INTERVAL;
}

@end
