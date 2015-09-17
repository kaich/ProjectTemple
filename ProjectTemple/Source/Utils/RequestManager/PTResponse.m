//
//  PTResponse.m
//  ProjectTemple
//
//  Created by mac on 14/11/13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "PTResponse.h"

@implementation PTResponse

+ (NSString *)resultKeyPathForJSONDictionary:(NSDictionary *)JSONDictionary
{
    return @"data";
}

@end
