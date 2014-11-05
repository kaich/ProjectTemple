//
//  BaseViewController.h
//  ProjectTemple
//
//  Created by Mac on 14-5-16.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DDTTYLogger.h>
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface BaseViewController : UIViewController
{
    UIView * _networkView;
}

/**
 *  show NetWorkStatus view
 *
 *  @param parentView
 */
-(void) showNetWorkStatusViewInView:(UIView*) parentView;
-(void) dismissNetWorkStatusView;



@end
