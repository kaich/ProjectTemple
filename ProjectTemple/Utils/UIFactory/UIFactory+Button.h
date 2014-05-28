//
//  UIFactory+Button.h
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory.h"

@interface UIFactory (Button)

/**
 *  创建UIButton 实例
 *
 *  @param title              标题
 *  @param bgName             背景
 *  @param normalName         正常图像名
 *  @param highlightImageName 高亮图
 *
 *  @return 实例
 */
+(UIButton*) createButtonWithTitle:(NSString *) title backgroundImageName:(NSString*) bgName normalImageName:(NSString *) normalName  highlightImageName:(NSString*) highlightImageName;

@end
