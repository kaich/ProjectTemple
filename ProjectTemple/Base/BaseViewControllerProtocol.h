//
//  BaseViewControllerProtocol.h
//  ProjectTemple
//
//  Created by mac on 14/11/7.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTHTTPRequestManager.h"

@protocol BaseViewControllerProtocol <NSObject>

@optional

//请求
@property(nonatomic,strong) PTHTTPRequestManager * requestManager;

//--------------重载一下方法获得正确的配置(@overide)------------------

//判断是否要创建Request manager
-(BOOL) isNeedHTTPRequestManager;



//---------------这些方法只是提供模板，具体调用在相应的类里面酌情调用----------------

/**
 *  seem to loadview method , create your views(创建视图）
 */
-(void) loadInitialViews;

/**
 *  config subview layout,frame(配置布局）
 */
-(void) configSubViewLayout;

/**
 *  run on viewDidLoad method, config  data(配置数据）
 */
-(void) configData;

/**
 *  send request to get data(请求数据)
 */
-(void) requestDataSource;

@end
