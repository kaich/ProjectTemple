//
//  CKDetailTableViewCell.m
//  ProjectTemple
//
//  Created by Mac on 14-5-29.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "CKDetailTableViewCell.h"

@implementation CKDetailTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.ivScreenShot=[UIFactory createImageViewWithFrame:self.bounds imageName:nil];
        self.ivScreenShot.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:self.ivScreenShot];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
