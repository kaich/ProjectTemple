//
//  CKAppleItemModel.m
//  ProjectTemple
//
//  Created by Mac on 14-5-26.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "CKAppleItemModel.h"

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

@end
