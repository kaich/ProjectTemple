//
//  CKLoginViewModel.m
//  ProjectTemple
//
//  Created by Mac on 14-5-23.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "CKLoginViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>



@interface CKLoginViewModel ()
@property(nonatomic,strong) RACCommand * loginCommand;
@end

@implementation CKLoginViewModel

-(id) init
{
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.loginCommand=[[RACCommand alloc] initWithEnabled:[self validateLoginInput] signalBlock:^RACSignal *(id input) {
        return [RACSignal empty];
    }];

    
    return self;

}

-(RACSignal *) validateLoginInput
{
    return [RACSignal combineLatest:@[RACObserve(self, userName), RACObserve(self, password)] reduce:^id(NSString *username, NSString *password){
        return @(username.length>0 && password.length>0);
    }];
}

@end
