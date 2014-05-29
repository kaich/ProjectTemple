//
//  CKDetailViewModel.m
//  ProjectTemple
//
//  Created by Mac on 14-5-29.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "CKDetailViewModel.h"

@implementation CKDetailViewModel

-(id) init
{
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    RAC(self,name)=RACObserve(self.model, appName);
    RAC(self,size)=RACObserve(self.model, appSize);
    RAC(self,price)=RACObserve(self.model, appPrice);
    RAC(self,iconUrl)=RACObserve(self.model, appIcon);
    RAC(self,screenShots)=RACObserve(self.model, appScreenShots);
    
    
    return self;

}

@end
