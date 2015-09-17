//
//  CKNotificationTableViewCell.m
//  ProjectTemple
//
//  Created by mac on 15/9/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CKNotificationTableViewCell.h"

@implementation CKNotificationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)shouldUpdateCellWithObject:(id)object
{
    self.backgroundColor = [UIColor redColor];
    return YES;
}

+ (CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    return  50;
}
@end
