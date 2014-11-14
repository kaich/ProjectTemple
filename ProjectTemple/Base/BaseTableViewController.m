//
//  BaseTableViewController.m
//  ProjectTemple
//
//  Created by mac on 14/11/5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseTableViewController.h"



@interface BaseTableViewController ()

@end

@implementation BaseTableViewController


#pragma mark - System method

-(void) loadView
{
    [super loadView];
    
    [self loadInitialViews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //initialize property
    self.pageIndex =0;
    self.countPerPage=COUNT_PER_PAGE;
    
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
        weakSelf.pageIndex =PAGE_START_INDEX;
        [weakSelf requestDataSource];
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        weakSelf.pageIndex ++;
       [weakSelf requestDataSource];
    }];
    
}


#pragma mark - Config DataSource
-(void) configData
{
    self.tableModel=[[NIMutableTableViewModel alloc] initWithDelegate:(id)[UIFactory class]];
    self.tableView.dataSource=self.tableModel;
    
    self.tableAction=[[NITableViewActions alloc] initWithTarget:self];
    self.tableView.delegate=self.tableAction;
    
    [self.tableView triggerPullToRefresh];
}

-(void) requestDataSource
{
    NSString * urlPath=[self requestURLPath];
    NSDictionary * parameters =[self requestParameters];
    
    if(urlPath)
    {
        [self.requestManager GET:urlPath parameters:parameters completion:^(NSArray *results) {
            [self configResponseDataSource:results];
            
        } failure:^(PTError *error) {
            if([self.tableView numberOfRowsInSection:0])
            {
                [self.tableView showStatusViewWithType:kSNNoNetwork];
            }
          
            [self showNetworkIssuStatusBarNotification];
            
            
        }];
    }
    else
    {
        THROW_EXCEPTION(@"url error", @"request url path is nil!");
    }
}


-(void) configResponseDataSource:(NSArray *) results
{
    if(self.pageIndex==PAGE_START_INDEX)
    {
        if(results.count==0)
        {
            [self.tableView showStatusViewWithType:kSNNoData];
        }
        
        [self clearTableModelData];
    }
    else
    {
        if(results.count==0)
        {
            InfiniteView * infiniteView=[UIFactory createInfiniteViewWithState:kIVSNoData];
            [self.tableView.infiniteScrollingView setCustomView:infiniteView forState:SVInfiniteScrollingStateAll];
            self.tableView.showsInfiniteScrolling=NO;
        }
        
    }
    
    [self.tableModel addObjectsFromArray:results];
    [self.tableModel updateSectionIndex];
    
    [self.tableView insertRowAtBottom:results.count];
}


#pragma mark - Overide Method 

-(NSString*) requestURLPath
{
    THROW_EXCEPTION(@"invoke error", @"you must overide requestURLPath method");
}

-(NSDictionary*) requestParameters
{
    THROW_EXCEPTION(@"invoke error", @"you must overide requestParameters method");
}

-(void) clearTableModelData
{
     [self.tableModel removeSectionAtIndex:0];
}

-(BOOL) isVerticalTableView
{
    return YES;
}

@end
