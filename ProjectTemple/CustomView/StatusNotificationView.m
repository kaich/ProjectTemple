//
//  NetWorkStatusOrNoDataView.m
//  ProjectTemple
//
//  Created by mac on 14/11/12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "StatusNotificationView.h"

@implementation StatusNotificationView

-(instancetype) initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    
    if(self)
    {
        
        self.backgroundColor =[UIColor clearColor];
        self.imageView = [UIFactory createImageViewWithFrame:CGRectMake(0, 0, 60, 60) imageName:nil];
        self.imageView.center=CGPointMake(self.center.x, 30);
        [self addSubview:self.imageView];
        
        self.lblContent=[UIFactory createLabelWithTitle:@"" frame:CGRectMake(0, self.imageView.bottom+5, self.width, 15)];
        self.lblContent.textAlignment=NSTextAlignmentCenter;
        self.lblContent.autoresizingMask=UIViewAutoresizingFlexibleWidth ;
        [self addSubview:self.lblContent];
        
    }
    
    return self;
}

@end
