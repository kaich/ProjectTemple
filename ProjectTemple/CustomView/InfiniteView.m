//
//  InfiniteView.m
//  ProjectTemple
//
//  Created by mac on 14/11/12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "InfiniteView.h"

@implementation InfiniteView


-(instancetype) init
{
    self=[super init];
    
    if(self)
    {
        self.lblContent=[UIFactory createLabelWithTitle:@"" frame:self.bounds];
        self.lblContent.textAlignment=NSTextAlignmentCenter;
        self.lblContent.autoresizingMask=UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.lblContent];
    }
    
    return self;
}


@end
