//
//  UIFactory+Line.h
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory.h"

typedef enum {
    kLSVer,      //纵
    kLSHor       //横
}LineStyle;



@interface UIFactory (Line)

/**
 *  创建线
 *
 *  @param style  样式
 *  @param length 长度
 *  @param origin 原点
 *
 *  @return 实例
 */
+(UIView*) createLine:(LineStyle) style  length:(float) length orgin:(CGPoint) origin color:(UIColor*) color;

@end
