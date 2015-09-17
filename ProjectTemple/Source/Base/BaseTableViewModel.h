//
//  BaseTableViewModel.h
//  ProjectTemple
//
//  Created by mac on 14/11/19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseViewModel.h"
#import "DZNEmptyEntity.h"

@interface BaseTableViewModel : BaseViewModel

@property(nonatomic,assign,readonly) NSInteger  pageIndex;
@property(nonatomic,assign,readonly) NSInteger  countPerPage;

@property(nonatomic,strong,readonly) NSArray * dataSource;
@property(nonatomic,strong,readonly) DZNEmptyEntity * emptyDataSetEntity;

@property(nonatomic,strong) NSString * requestURLPath;
@property(nonatomic,strong) NSDictionary * requestParameters;

@property(nonatomic,strong) RACCommand * refreshDataSource;
@property(nonatomic,strong) RACCommand * inflineRequestDataSource;

@end
