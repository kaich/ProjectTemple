//
//  NotificationEntity.h
//  your_project_name
//
//  Created by CK on 15-09-16.
//  Copyright (c) 2015年 CK. All rights reserved.

#import <MTLModel.h>
#import <MTLJSONAdapter.h>
#import "BaseEntity.h"




@interface NotificationEntity: BaseEntity<MTLJSONSerializing,NICellObject>
@property(nonatomic,assign) NSInteger entityId;
@property(nonatomic,strong) NSString * createTime;
@property(nonatomic,strong) NSString * author;
@property(nonatomic,strong) NSString * title;
@property(nonatomic,strong) NSString * color;
@property(nonatomic,assign) NSInteger highlight;
@property(nonatomic,strong) NSString * url;

@end
