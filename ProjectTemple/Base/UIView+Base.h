//
//  UIView+Base.h
//  ProjectTemple
//
//  Created by 程凯 on 14/11/12.
//  Copyright (c) 2014年 程凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Base)
//网络状态
@property(nonatomic,strong) UIView * networkView;

-(void) showStatusViewWithType:(StatusNotificationViewType  ) type;
-(void) dismissNetWorkStatusView;


@end
