//
//  UIFactory+Label.m
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory+Label.h"

@implementation UIFactory (Label)


+(UILabel*) createLabelWithTitle:(NSString *)title frame:(CGRect)frame
{
    UILabel * label=[[UILabel alloc] initWithFrame:frame];
    label.text=title;
    label.font=FONT(15);
    label.textColor=[UIColor blackColor];
    
    return  label;
}

@end
