//
//  BaseTableViewCell.m
//  ProjectTemple
//
//  Created by mac on 14/11/10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        if(![[self class] isVerticalTableViewCell])
        {
            self.transform=CGAffineTransformMakeRotation(-M_PI/2);
        }
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma  mark - NICell Protocal

- (BOOL)shouldUpdateCellWithObject:(id)object
{
    THROW_EXCEPTION(@"invoke error", @"you must overide shouldUpdateCellWithObject method");
    return  YES;
}


+ (BOOL)shouldAppendObjectClassToReuseIdentifier
{
    return  YES;
}


+ (CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    
    return 44;
}

//-------------Overide Method-------------
+(BOOL) isVerticalTableViewCell
{
    return YES;
}


@end
