//
//  UIFactory+TextField.h
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory.h"

@interface UIFactory (TextField)
/**
 *  创建UITextField 实例
 *
 *  @param placeHolder 占位
 *  @param frame       位置
 *
 *  @return 实例
 */
+(UITextField*) createTextFieldWithPlaceholder:(NSString*) placeHolder frame:(CGRect) frame;

@end
