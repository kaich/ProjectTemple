//
//  CKLoginViewModel.h
//  ProjectTemple
//
//  Created by Mac on 14-5-23.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "RVMViewModel.h"
#import <RACCommand.h>

@interface CKLoginViewModel : RVMViewModel
@property(nonatomic,strong) NSString * userName;
@property(nonatomic,strong) NSString * password;
@property(nonatomic,strong,readonly) RACCommand * loginCommand;
@end
