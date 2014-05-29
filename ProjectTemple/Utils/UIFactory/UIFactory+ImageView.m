//
//  UIFactory+ImageView.m
//  ProjectTemple
//
//  Created by Mac on 14-5-29.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory+ImageView.h"

@implementation UIFactory (ImageView)


+(UIImageView *) createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView * imageView=[[UIImageView alloc] initWithFrame:frame];
    if(imageName.length>0)
    {
        imageView.image=IMAGE_NAME(imageName);
    }
    
    return imageView;
}

@end
