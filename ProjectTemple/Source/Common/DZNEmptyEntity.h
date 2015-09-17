//
//  DZNEmptyEntity.h
//  ProjectTemple
//
//  Created by mac on 15/9/17.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZNEmptyEntity : NSObject
@property(nonatomic,strong) NSAttributedString * title;
@property(nonatomic,strong) NSAttributedString * emptyDescription;
@property(nonatomic,strong) NSString * imageName;
@property(nonatomic,strong) UIColor * imageTintColor;
@property(nonatomic,strong) NSDictionary * buttonTitle;
@property(nonatomic,strong) NSDictionary * buttonImage;
@property(nonatomic,strong) NSDictionary * buttonBackgroundImage;
@property(nonatomic,strong) UIColor * backgroundColor;

@end
