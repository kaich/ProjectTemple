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
#import <UIScrollView+EmptyDataSet.h>
#import "BaseViewModel.h"


static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface BaseViewController : UIViewController<BaseViewControllerProtocol,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property(nonatomic,strong) UIScrollView * scrollView;

//状态栏通知
@property(nonatomic,strong,readonly) CWStatusBarNotification * statusbarNotification;

//网络状态和加载视图
@property(nonatomic,strong) StatusNotificationView  * contentStatusView;

// The view model for the receiver.
@property (nonatomic, strong) BaseViewModel *viewModel;


// Initializes the receiver with a view model, and without a nib.
- (id)initWithViewModel:(BaseViewModel *)viewModel;

// Initializes the receiver with a view model, and optionally a nib and bundle.
//
// This is the designated initializer for this class.
- (id)initWithViewModel:(BaseViewModel *)viewModel nibName:(NSString *)nibName bundle:(NSBundle *)bundle;


-(void) showNetworkIssuStatusBarNotification;

@end
