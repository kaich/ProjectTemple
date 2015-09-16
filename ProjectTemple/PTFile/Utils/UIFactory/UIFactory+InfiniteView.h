//
//  UIFactory+InfiniteView.h
//  ProjectTemple
//
//  Created by mac on 14/11/12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIFactory.h"
#import <SVPullToRefresh.h>
#import "InfiniteView.h"

@interface UIFactory (InfiniteView)

+(InfiniteView*) createInfiniteViewWithState:(InfiniteViewState) state;

@end
