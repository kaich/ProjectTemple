//
//  UIFactory+NetWorkStatusView.h
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIFactory.h"
#import "StatusNotificationView.h"

typedef NS_ENUM(NSUInteger, StatusNotificationViewType) {
    kSNNoNetwork=1,
    kSNNoData,
    kSNNoDataLoading,
    kSNNoMoreData,
};

@interface UIFactory (StatusNotificationView)


+(StatusNotificationView*) createStatusNotificationViewWithType:(StatusNotificationViewType ) type;

@end
