//
//  UIFactory+Switch.h
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory.h"

@interface UIFactory (Switch)

/**
 *  创建开关
 *
 *  @return 实例
 */
+(UISwitch*) createSwitchWithOrgin:(CGPoint) orgin;

@end
