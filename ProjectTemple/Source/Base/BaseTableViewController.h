//
//  BaseTableViewController.h
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
#import "BaseTableViewModel.h"
#import <UIScrollView+EmptyDataSet.h>

@interface BaseTableViewController : BaseViewController<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property(nonatomic,strong) NSString * requestURLPath;
@property(nonatomic,strong) NSDictionary * parameters;

@property(nonatomic,strong) IBOutlet UITableView * tableView;
@property(nonatomic,strong) NITableViewActions * tableAction;

// The view model for the receiver.
@property (nonatomic, strong) BaseTableViewModel *viewModel;


//-------------Overide Method-------------

-(void) clearTableModelData;
@end
