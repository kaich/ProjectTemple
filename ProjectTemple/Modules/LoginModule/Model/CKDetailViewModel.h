//
//  CKDetailViewModel.h
//  ProjectTemple
//
//  Created by Mac on 14-5-29.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "RVMViewModel.h"
#import "CKAppleItemModel.h"

@interface CKDetailViewModel : RVMViewModel
@property(nonatomic,strong) CKAppleItemModel * model;

@property(nonatomic,strong) NSString * name;
@property(nonatomic,strong) NSString * price;
@property(nonatomic,strong) NSString * size;
@property(nonatomic,strong) NSURL * iconUrl;
@property(nonatomic,strong) NSArray * screenShots;
@end
