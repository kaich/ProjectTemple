//
//  NotificationEntity.h
//  your_project_name
//
//  Created by CK on 15-09-16.
//  Copyright (c) 2015年 CK. All rights reserved.

#import "NotificationEntity.h"
#import <MTLValueTransformer.h>
#import "CKNotificationTableViewCell.h"
 
//json column declare
static NSString * EntityIdJsonKey = @"id";
static NSString * CreateTimeJsonKey = @"createTime";
static NSString * AuthorJsonKey = @"author";
static NSString * TitleJsonKey = @"title";
static NSString * ColorJsonKey = @"color";
static NSString * HighlightJsonKey = @"highlight";
static NSString * UrlJsonKey = @"url";



@implementation NotificationEntity

#pragma mark - json method
+(NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{
            @"entityId":EntityIdJsonKey,
            @"createTime":CreateTimeJsonKey,
            @"author":AuthorJsonKey,
            @"title":TitleJsonKey,
            @"color":ColorJsonKey,
            @"highlight":HighlightJsonKey,
            @"url":UrlJsonKey
           };
}



- (Class)cellClass
{
    return [CKNotificationTableViewCell class];
}
@end
