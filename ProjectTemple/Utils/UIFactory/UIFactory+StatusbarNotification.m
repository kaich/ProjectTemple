//
//  UIFactory+StatusbarNotification.m
//  ProjectTemple
//
//  Created by mac on 14/11/13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIFactory+StatusbarNotification.h"

@implementation UIFactory (StatusbarNotification)

+(CWStatusBarNotification *) createStatusBarNotification
{
    CWStatusBarNotification * statusbarNotification =[[CWStatusBarNotification alloc] init];
    statusbarNotification.notificationAnimationInStyle=CWNotificationAnimationStyleTop;
    statusbarNotification.notificationAnimationOutStyle=CWNotificationAnimationStyleBottom;
    statusbarNotification.notificationAnimationType=CWNotificationStyleStatusBarNotification;
    
    return statusbarNotification;
}

@end
