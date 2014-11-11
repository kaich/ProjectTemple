//
//  BaseEntity.m
//  ProjectTemple
//
//  Created by mac on 14/11/10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity

#pragma mark - Nimbus method
-(Class)cellClass
{
    @throw [NSException exceptionWithName:@"invoke error" reason:@"you must overide this method !" userInfo:nil];
    
    return nil;
}


-(UITableViewCellStyle)cellStyle
{
    return UITableViewCellStyleDefault;
}

@end
