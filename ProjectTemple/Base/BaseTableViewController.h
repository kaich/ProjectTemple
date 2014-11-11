//
//  BaseTableViewController.h
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SVPullToRefresh.h>

@interface BaseTableViewController : BaseViewController
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NIMutableTableViewModel * tableModel;
@property(nonatomic,strong) NITableViewActions * tableAction;

@property(nonatomic,strong) PTHTTPRequestManager * requestManager;

@property(nonatomic,assign) NSInteger  pageIndex;
@property(nonatomic,assign) NSInteger  countPerPage;
@end
