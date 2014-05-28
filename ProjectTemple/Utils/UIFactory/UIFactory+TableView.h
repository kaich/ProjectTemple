//
//  UIFactory+TableView.h
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory.h"

@interface UIFactory (TableView)

/**
 *  创建tableview
 *
 *  @param frame    坐标
 *  @param style    样式
 *  @param delegate 代理
 *
 *  @return 实例
 */
+(UITableView*) createTableViewWithFrame:(CGRect) frame style:(UITableViewStyle) style  delegate:(id<UITableViewDelegate,UITableViewDataSource>) delegate;

@end
