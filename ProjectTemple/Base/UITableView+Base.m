//
//  UITableView+Base.m
//  ProjectTemple
//
//  Created by 程凯 on 14/11/12.
//  Copyright (c) 2014年 程凯. All rights reserved.
//

#import "UITableView+Base.h"

@implementation UITableView (Base)


- (void)insertRowAtBottom:(NSInteger) count
{
    
    @synchronized(self)
    {
        __weak typeof(self)weakSelf = self;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            
            NSMutableArray  * indexPaths=[NSMutableArray array];
            for (int i=0; i<count; i++) {
                NSIndexPath * indexPath=[NSIndexPath indexPathForRow:count+i inSection:0];
                [indexPaths addObject:indexPath];
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                [weakSelf beginUpdates];
                [weakSelf insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
                [weakSelf endUpdates];
            });
        });
        
    }
}

@end
