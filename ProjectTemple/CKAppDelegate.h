//
//  CKAppDelegate.h
//  ProjectTemple
//
//  Created by Mac on 14-5-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DDTTYLogger.h>

@interface CKAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIViewController * _rootViewController;
}
@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,strong,readonly) UIViewController * rootViewController;
@end
