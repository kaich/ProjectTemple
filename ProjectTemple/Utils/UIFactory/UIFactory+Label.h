//
//  UIFactory+Label.h
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory.h"

@interface UIFactory (Label)

/**
 *  创建 label
 *
 *  @param title 标题
 *  @param frame 坐标
 *
 *  @return 实例
 */
+(UILabel*) createLabelWithTitle:(NSString*) title frame:(CGRect) frame;

@end
