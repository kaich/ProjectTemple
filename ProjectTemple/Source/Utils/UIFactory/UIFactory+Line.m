//
//  UIFactory+Line.m
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory+Line.h"

@implementation UIFactory (Line)

+(UIView*) createLine:(LineStyle )style length:(float)length orgin:(CGPoint)origin color:(UIColor *)color
{
    UIView * line=nil;
    if(style==kLSHor)
    {
        line =[[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, length, 1)];
    }
    else
    {
        line =[[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, 1, length)];
    }
    
    line.backgroundColor=color;
    
    return line;
    
}
@end
