//
//  PTHTTPRequestBaseManager.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "PTHTTPRequestBaseManager.h"
#import <Overcoat.h>

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


-(NSDictionary *) globalConfig
{
    NSDictionary * config = @{
                                STRING_FROM_PROPERTY(TIME_OUT_INTERVAL) :  STRING_FROM_PROPERTY(requestSerializer.timeoutInterval)
                             };
    
    APPLY_CONFIG_ITEM_IN_DIC(config);
    
    config
    
    return config;
}

@end
