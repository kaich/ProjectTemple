//
//  UIFactory+NetWorkStatusView.h
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIFactory.h"

@interface UIFactory (NetWorkStatusView)

+(UIImageView*) createNetWorkStatusViewWithNetWorkStatus:(PTNetworkReachabilityStatus ) status;

@end
