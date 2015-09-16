//
//  UIFactory+InfiniteView.m
//  ProjectTemple
//
//  Created by mac on 14/11/12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIFactory+InfiniteView.h"

@implementation UIFactory (InfiniteView)

+(InfiniteView*) createInfiniteViewWithState:(InfiniteViewState ) status
{
    InfiniteView * infiniteView = [[InfiniteView alloc] init];
    infiniteView.lblContent.text = [self contentForState:status];
    
    return infiniteView;
}


+(NSString *) contentForState:(InfiniteViewState)state
{
    NSArray * contents = @[@"亲，已经到底了",@"加载完成",@"释放加载更多",@"加载中..."];

    return  [contents objectAtIndex:state];
}

@end
