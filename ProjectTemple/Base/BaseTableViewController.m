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
    self.requestManager=[[PTHTTPRequestManager alloc] init];
    
    [self configData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Config UI
-(void) loadInitialViews
{
    self.tableView=[UIFactory createTableViewWithFrame:self.view.bounds style:UITableViewStylePlain delegate:nil];
    
    //上拉、下拉 功能
    __weak typeof (self) weakSelf  = self;
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        weakSelf.pageIndex =PAGE_START_INDEX;
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        weakSelf.pageIndex ++;
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
            
        } failure:^(PTError *error) {
            [self showNetWorkStatusViewInView:self.tableView];
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
        [self clearTableModelData];
    }
    
    [self.tableModel addObjectsFromArray:results];
    [self.tableModel updateSectionIndex];
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

@end
