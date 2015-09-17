//
//  BaseViewModel.h
//  ProjectTemple
//
//  Created by mac on 14/11/18.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "RVMViewModel.h"
#import "BaseViewModelProtocol.h"
#import "UIFactory+StatusNotificationView.h"

@interface BaseViewModel : RVMViewModel<BaseViewModelProtocol>
//请求
@property(nonatomic,strong,readonly) PTHTTPRequestManager * requestManager;

//状态 (网络异常、无数据)
@property(nonatomic,assign) StatusNotificationViewType contentType;

@end
