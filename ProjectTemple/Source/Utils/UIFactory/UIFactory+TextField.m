//
//  UIFactory+TextField.m
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory+TextField.h"

@implementation UIFactory (TextField)

+(UITextField*) createTextFieldWithPlaceholder:(NSString *)placeHolder frame:(CGRect)frame
{
    UITextField * textField=[[UITextField alloc] initWithFrame:frame];
    textField.placeholder=placeHolder;
    textField.borderStyle=UITextBorderStyleRoundedRect;
    
    return  textField;
}

@end
