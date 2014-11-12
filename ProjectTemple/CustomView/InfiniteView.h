//
//  InfiniteView.h
//  ProjectTemple
//
//  Created by mac on 14/11/12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, InfiniteViewState) {
    kIVSNoData,
    kIVSStopped = 0,
    kIVSTriggered,
    kIVSLoading,
};

@interface InfiniteView : UIView
@property(nonatomic,strong) UILabel * lblContent;


@end
