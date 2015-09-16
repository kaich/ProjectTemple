//
//  UIView+Base.m
//  ProjectTemple
//
//  Created by 程凯 on 14/11/12.
//  Copyright (c) 2014年 程凯. All rights reserved.
//

#import "UIView+Base.h"
#import <objc/runtime.h>

static NSString * NetWorkView ;

@implementation UIView (Base)

#pragma mark - Dynamic Method

-(UIView*) networkView
{
    return objc_getAssociatedObject(self, &NetWorkView);
}

-(void) setNetworkView:(UIView *)networkView
{
    objc_setAssociatedObject(self, &NetWorkView, networkView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - NetWorkStatusView Method

-(void) showStatusViewWithType:(StatusNotificationViewType ) type
{
    if(!self.networkView)
    {
        if(COMMON.networkStatus==PTNetworkReachabilityStatusNotReachable)
        {
            type=kSNNoNetwork;
        }
        
        self.networkView= [UIFactory createStatusNotificationViewWithType:type];
    }
    self.networkView.frame=self.bounds;
    self.networkView.center=self.center;
    [self addSubview:self.networkView];
}

-(void) dismissNetWorkStatusView
{
    [self.networkView removeFromSuperview];
}

@end
