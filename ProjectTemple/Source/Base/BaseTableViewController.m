//
//  BaseTableViewController.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseTableViewController.h"


@implementation BaseTableViewController
@dynamic viewModel;

#pragma mark - System method


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self loadInitialViews];
    [self configData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Config UI
-(void) loadInitialViews
{
    BOOL isVertical= [self isVerticalTableView];
    
    if(!self.tableView)
    {
        if(isVertical)
        {
            self.tableView=[UIFactory createTableViewWithFrame:self.view.bounds style:UITableViewStylePlain delegate:nil];
        }
        else
        {
            self.tableView=[UIFactory createHorizontalTableViewWithFrame:self.view.bounds style:UITableViewStylePlain delegate:nil];
        }
        self.scrollView = self.tableView;
        [self.view addSubview:self.tableView];
    }
    
    //上拉、下拉 功能
    __weak typeof (self) weakSelf  = self;
    
    self.tableView.header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf.viewModel.refreshDataSource execute:nil];
    }];
    
    self.tableView.footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf.viewModel.inflineRequestDataSource execute:nil];
    }];
    
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
}


#pragma mark - Config DataSource
-(void) configData
{
    RAC(self.tableView , dataSource) = RACObserve(self.viewModel, tableViewModel);
    
    self.tableAction=[[NITableViewActions alloc] initWithTarget:self];
    self.tableView.delegate=self.tableAction;
    
    @weakify(self);
    [RACObserve(self.viewModel, dataSourceChanged) subscribeNext:^(id x) {
        @strongify(self);
        if(x)
        {
            [self.tableView reloadData];
        }
        
        if(self.tableView.header.isRefreshing)
        {
            [self.tableView.header endRefreshing];
        }
        if(self.tableView.footer.isRefreshing)
        {
            [self.tableView.footer endRefreshing];
        }
        
    }];
     
    
    [[self.viewModel.contentTypeSignal distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
        //statusView is instead by DZNEmptyDataSet
        //[self.tableView showStatusViewWithType:type];
        StatusNotificationViewType  type = [x  integerValue];
        
        if(type == kSNNoNetwork)
        {
            [self showNetworkIssuStatusBarNotification];
        }

        if(self.tableView.header.isRefreshing)
        {
            [self.tableView.header endRefreshing];
        }
        if(self.tableView.footer.isRefreshing)
        {
            [self.tableView.footer endRefreshing];
        }
        [self.tableView reloadEmptyDataSet];
    }];
    
}


#pragma mark - DZNEmptyDataSetSource and DZNEmptyDataSetDelegate
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    self.viewModel.contentType = kSNNoDataLoading;
    [self.viewModel.refreshDataSource execute:nil];
}

#pragma mark - Overide Method

-(void) clearTableModelData
{
     [self.viewModel.tableViewModel removeSectionAtIndex:0];
}

-(BOOL) isVerticalTableView
{
    return YES;
}

@end
