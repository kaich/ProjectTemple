//
//  UIFactory+NetWorkStatusView.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIFactory+StatusNotificationView.h"

@implementation UIFactory (StatusNotificationView)

+(StatusNotificationView*) createStatusNotificationViewWithType:(StatusNotificationViewType ) type;
{
    StatusNotificationView * statusView=[[StatusNotificationView alloc] initWithFrame:CGRectZero];
    
    switch (type) {
        case kSNNoData:
        {
            statusView.lblContent.text=@"没有搜索到相应数据";
            return statusView;
        }
            break;
        case kSNNoNetwork:
        {
            statusView.lblContent.text=@"请检查您的网络状态";
            return statusView;
        }
            break;
        case kSNNoDataLoading:
        {
            statusView.lblContent.text=@"数据加载中...";
            return statusView;
        }
            break;
        default:
            break;
    }
    
    return  nil;
}

@end
