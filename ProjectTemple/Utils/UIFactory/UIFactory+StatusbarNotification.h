//
//  UIFactory+StatusbarNotification.h
//  ProjectTemple
//
//  Created by mac on 14/11/13.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIFactory.h"
#import <CWStatusBarNotification.h>

@interface UIFactory (StatusbarNotification)

+(CWStatusBarNotification *) createStatusBarNotification;

@end
