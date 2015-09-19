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
        [self.view addSubview:self.tableView];
    }
    
    //上拉、下拉 功能
    __weak typeof (self) weakSelf  = self;
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf.viewModel.refreshDataSource execute:nil];
    }];
    
    
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
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
        
        [self.tableView.infiniteScrollingView stopAnimating];
        [self.tableView.pullToRefreshView stopAnimating];
        
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
        else if(type ==kSNNoMoreData)
        {
 
            InfiniteView * infiniteView=[UIFactory createInfiniteViewWithState:kIVSNoData];
            [self.tableView.infiniteScrollingView setCustomView:infiniteView forState:SVInfiniteScrollingStateAll];
            self.tableView.showsInfiniteScrolling=NO;
        }
        else if(type == kSNNoData)
        {
            
            [self.tableView.infiniteScrollingView stopAnimating];
            [self.tableView.pullToRefreshView stopAnimating];
            self.tableView.showsInfiniteScrolling=NO;
        }

        [self.tableView.infiniteScrollingView stopAnimating];
        [self.tableView.pullToRefreshView stopAnimating];
        [self.tableView reloadEmptyDataSet];
    }];
    
}


#pragma mark - DZNEmptyDataSetSource and DZNEmptyDataSetDelegate
-(BOOL) emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    if(self.tableView == scrollView)
    {
        BOOL isEmptyVisible = self.viewModel.contentType == kSNNoData || self.viewModel.contentType == kSNNoNetwork || self.viewModel.contentType == kSNNoDataLoading;
        return isEmptyVisible;
    }
    else
    {
        return NO;
    }
}

-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
   return  self.viewModel.emptyDataSetEntity.title;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.viewModel.emptyDataSetEntity.emptyDescription;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return ImageNamed(self.viewModel.emptyDataSetEntity.imageName);
}

- (UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.viewModel.emptyDataSetEntity.imageTintColor;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [self.viewModel.emptyDataSetEntity.buttonTitle objectForKey:@(state)]?:[self.viewModel.emptyDataSetEntity.buttonTitle objectForKey:@(UIControlStateNormal)];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [self.viewModel.emptyDataSetEntity.buttonImage objectForKey:@(state)]?:[self.viewModel.emptyDataSetEntity.buttonImage objectForKey:@(UIControlStateNormal)];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [self.viewModel.emptyDataSetEntity.buttonBackgroundImage objectForKey:@(state)]?:[self.viewModel.emptyDataSetEntity.buttonBackgroundImage objectForKey:@(UIControlStateNormal)];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.viewModel.emptyDataSetEntity.backgroundColor;
}

- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    self.viewModel.contentType = kSNNoDataLoading;
    [self.tableView triggerPullToRefresh];
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
