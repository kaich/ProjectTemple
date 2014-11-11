//
//  UIViewController+Base.h
//  ProjectTemple
//
//  Created by mac on 14/11/7.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (Base)


/**
 *  show NetWorkStatus view
 *
 *  @param parentView
 */
-(void) showNetWorkStatusViewInView:(UIView*) parentView;
-(void) dismissNetWorkStatusView;


@end
