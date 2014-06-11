//
//  CKAppleItemModel.m
//  ProjectTemple
//
//  Created by Mac on 14-5-26.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "CKAppleItemModel.h"
#import <MTLValueTransformer.h>

@implementation CKAppleItemModel


+(NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{@"appName" :@"trackName",
             @"appVersion" : @"version",
             @"appSize" : @"fileSizeBytes",
             @"appPrice" : @"price",
             @"appIcon":@"artworkUrl512",
             @"appScreenShots":@"screenshotUrls"
             };
}


+(NSValueTransformer * ) JSONTransformerForKey:(NSString *)key
{
     if([key isEqualToString:@"appName"])
     {
        return  [MTLValueTransformer transformerWithBlock:^id(id x) {
             return [NSString stringWithFormat:@"%@",x];
         }];
         
     }
     else if([key isEqualToString:@"appSize"])
     {
         return  [MTLValueTransformer transformerWithBlock:^id(id x) {
             return [NSString stringWithFormat:@"%@",x];
         }];
         
     }
     else if([key isEqualToString:@"appPrice"])
     {
         return  [MTLValueTransformer transformerWithBlock:^id(id x) {
             return [NSString stringWithFormat:@"%@",x];
         }];
         
     }
    
    return  nil;
}

@end
