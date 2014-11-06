//
//  Config.h
//  ProjectTemple
//
//  Created by Mac on 14-5-16.
//  Copyright (c) 2014年 Mac. All rights reserved.
//


#import "NSDate+TimeAgo.h"
#import "NSDate+Utilities.h"
#import "UIView+Helpers.h"
#import "UIView+Snapshot.h"
#import "NSString+Helpers.h"
#import "NSUserDefaults+Helpers.h"
#import "UIColor+Helper.h"
#import "BaseViewController.h"
#import "UIFactory.h"
#import "Macro.h"
#import "UserMacro.h"
#import "Common.h"
#import "NSString+PDRegex.h"
#import "RegExCategories.h"
#import "UILabel+Additions.h"
#import "CKUIFactory.h"
#import "ViewUtils.h"
#import <ReactiveCocoa.h>




//-----------------------------------SERVER_URL-----------------------------------------
static NSString *BASE_HOME_URL =  @""

//-----------------------------------NOTIFICATION---------------------------------------



//-----------------------------------KEY_VALUE------------------------------------------



//-----------------------------------SETTING--------------------------------------------

//
//  Request
//
const static float  TIME_OUT_INTERVAL                   = 15;

const static NSString *REQUEST_TIME_OUT_MESSAGE         =  @"";
const static NSString *REQUEST_NO_NETWORK_MESSAGE       =  @"";
const static NSString *REQUEST_UNKNOW_ERROR_MESSAGE     =  @""




//-----------------------------------UI------------------------------------------------
#define DEFUALT_VIEW_BACKGROUND_COLOR    [UIColor whiteColor]