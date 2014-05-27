//
//  UIFactory.m
//  I4Web
//
//  Created by Mac on 14-5-13.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory
+(UILabel*) createLabelWithTitle:(NSString *)title frame:(CGRect)frame
{
    UILabel * label=[[UILabel alloc] initWithFrame:frame];
    label.text=title;
    label.font=FONT(15);
    label.textColor=[UIColor blackColor];
    
    return  label;
}

+(UISwitch*) createSwitchWithOrgin:(CGPoint)orgin
{
    UISwitch * swControl=[[UISwitch alloc] initWithFrame:CGRectMake(orgin.x, orgin.y, 0, 0)];
    return swControl;
}


+(UITableView*) createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style delegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate
{
    UITableView* tableview=[[UITableView alloc] initWithFrame:frame style:style];
    tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    tableview.delegate=delegate;
    tableview.dataSource=delegate;
    
    return tableview;
}


+(UIView*) createLine:(LineStyle )style length:(float)length orgin:(CGPoint)origin color:(UIColor *)color
{
    UIView * line=nil;
    if(style==kLSHor)
    {
        line =[[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, length, 1)];
    }
    else
    {
        line =[[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, 1, length)];
    }
    
    line.backgroundColor=color;
    
    return line;
    
}

@end
