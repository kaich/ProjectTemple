//
//  UIFactory+Button.m
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory+Button.h"

@implementation UIFactory (Button)

+(UIButton *) createButtonWithTitle:(NSString *)title backgroundImageName:(NSString *)bgName normalImageName:(NSString *)normalName highlightImageName:(NSString *)highlightImageName
{
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    if(title.length>0)
        [button setTitle:title forState:UIControlStateNormal];
    if(bgName.length>0)
        [button setBackgroundImage:IMAGE_NAME(bgName) forState:UIControlStateNormal];
    if(normalName.length>0)
        [button setImage:IMAGE_NAME(normalName) forState:UIControlStateNormal];
    if(highlightImageName.length>0)
        [button setImage:IMAGE_NAME(highlightImageName) forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    return  button;
}

@end
