//
//  BaseViewController.h
//  ProjectTemple
//
//  Created by Mac on 14-5-16.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DDTTYLogger.h>
#import "BaseViewControllerProtocol.h"
#import "UIViewController+Base.h"
#import <Nimbus/NimbusModels.h>


static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface BaseViewController : UIViewController<BaseViewControllerProtocol>
//请求
@property(nonatomic,strong,readonly) PTHTTPRequestManager * requestManager;

//状态栏通知
@property(nonatomic,strong,readonly) CWStatusBarNotification * statusbarNotification;

-(void) showNetworkIssuStatusBarNotification;

@end
