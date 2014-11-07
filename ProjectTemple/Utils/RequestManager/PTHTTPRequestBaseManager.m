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

@implementation PTHTTPRequestBaseManager

+(Class) responseClass
{
    return [OVCResponse class];
}

+(Class) errorModelClass
{
    return [PTError class];
}

+ (NSDictionary *)modelClassesByResourcePath {
#warning 等待实现
    return @{
             
             };
}


-(void) globalConfig
{
    self.requestSerializer.timeoutInterval=TIME_OUT_INTERVAL;
}

@end
