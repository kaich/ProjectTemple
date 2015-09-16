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
    

    
    @weakify(self);
    
    self.requestDetail =[[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [[[self.requestManager rac_GET:@"/lookup" parameters:@{@"id" : @"444934666", @"country" : @"cn"}]  catch:^RACSignal *(NSError *error) {
            @strongify(self);
            
            if(error)
                self.contentType= kSNNoNetwork;
            
            return [RACSignal empty];
        }] subscribeNext:^(PTResponse * response) {
            @strongify(self);
            
            NSArray * models=response.result;
            CKAppleItemModel * model = [models firstObject];
            self.model = model;
            self.name=model.appName;
            self.price=model.appPrice;
            self.size=model.appSize;
            self.screenShots =model.appScreenShots;
            
        }] ;
        
        return [RACSignal empty];
    }];
    

    
    return self;

}



@end
