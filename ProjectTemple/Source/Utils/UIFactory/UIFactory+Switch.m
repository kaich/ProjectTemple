//
//  UIFactory+Switch.m
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory+Switch.h"

@implementation UIFactory (Switch)

+(UISwitch*) createSwitchWithOrgin:(CGPoint)orgin
{
    UISwitch * swControl=[[UISwitch alloc] initWithFrame:CGRectMake(orgin.x, orgin.y, 0, 0)];
    return swControl;
}



@end
