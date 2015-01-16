//
//  BaseTableViewController.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseTableViewController.h"


@implementation BaseTableViewController


#pragma mark - System method

-(void) loadView
{
    [super loadView];
    
    [self loadInitialViews];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
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
    
    if(isVertical)
    {
        self.tableView=[UIFactory createTableViewWithFrame:self.view.bounds style:UITableViewStylePlain delegate:nil];
    }
    else
    {
        self.tableView=[UIFactory createHorizontalTableViewWithFrame:self.view.bounds style:UITableViewStylePlain delegate:nil];
    }
    
    //上拉、下拉 功能
    __weak typeof (self) weakSelf  = self;
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf.viewModel.refreshDataSource execute:nil];
    }];
    
    
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf.viewModel.inflineRequestDataSource execute:nil];
    }];
    
}


#pragma mark - Config DataSource
-(void) configData
{
    self.tableModel=[[NIMutableTableViewModel alloc] initWithDelegate:(id)[UIFactory class]];
    self.tableView.dataSource=self.tableModel;
    
    self.tableAction=[[NITableViewActions alloc] initWithTarget:self];
    self.tableView.delegate=self.tableAction;
    
    @weakify(self);
    [RACObserve(self.viewModel, dataSource) aggregateWithStart:self.tableModel reduce:^id(NIMutableTableViewModel * runningModel, id next) {
        @strongify(self);
        [runningModel addObject:next];
        [runningModel updateSectionIndex];

        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.tableView insertRowAtBottom:1];
        });
        
        return [RACSignal return:nil];
    }];
    
    [RACObserve(self.viewModel, contentType) subscribeNext:^(NSNumber * typeValue) {
        @strongify(self);
        StatusNotificationViewType  type = [typeValue  integerValue];
        [self.tableView showStatusViewWithType:type];
        
        if(type == kSNNoNetwork)
        {
            [self showNetworkIssuStatusBarNotification];
        }
        else if(type ==kSNNoMoreData)
        {
 
            InfiniteView * infiniteView=[UIFactory createInfiniteViewWithState:kIVSNoData];
            [self.tableView.infiniteScrollingView setCustomView:infiniteView forState:SVInfiniteScrollingStateAll];
            self.tableView.showsInfiniteScrolling=NO;
        }
    }];
    
    
    [self.tableView triggerPullToRefresh];
}



#pragma mark - Overide Method

-(void) clearTableModelData
{
     [self.tableModel removeSectionAtIndex:0];
}

-(BOOL) isVerticalTableView
{
    return YES;
}

@end
