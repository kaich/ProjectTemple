//
//  UIFactory+TableView.m
//  ProjectTemple
//
//  Created by Mac on 14-5-28.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory+TableView.h"

@implementation UIFactory (TableView)

+(UITableView*) createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style delegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate
{
    UITableView* tableview=[[UITableView alloc] initWithFrame:frame style:style];
    tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    tableview.delegate=delegate;
    tableview.dataSource=delegate;
    
    return tableview;
}


+(UITableView*) createHorizontalTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style delegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate
{
    float originX=frame.origin.x+frame.size.width-frame.size.height;
    float originY=frame.origin.y+frame.size.height-frame.size.width;
    
    UITableView* tableview=[[UITableView alloc] initWithFrame:CGRectMake(originX, originY, frame.size.height, frame.size.width) style:style];
    tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    tableview.delegate=delegate;
    tableview.dataSource=delegate;
    tableview.transform=CGAffineTransformMakeRotation(M_PI/2);
    
    return tableview;
}

@end
