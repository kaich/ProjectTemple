//
//  UIFactory.h
//  I4Web
//
//  Created by Mac on 14-5-13.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    kLSVer,      //纵
    kLSHor       //横
}LineStyle;


@interface UIFactory : NSObject

/**
 *  创建 label
 *
 *  @param title 标题
 *  @param frame 坐标
 *
 *  @return 实例
 */
+(UILabel*) createLabelWithTitle:(NSString*) title frame:(CGRect) frame;

/**
 *  创建开关
 *
 *  @return 实例
 */
+(UISwitch*) createSwitchWithOrgin:(CGPoint) orgin;

/**
 *  创建tableview
 *
 *  @param frame    坐标
 *  @param style    样式
 *  @param delegate 代理
 *
 *  @return 实例
 */
+(UITableView*) createTableViewWithFrame:(CGRect) frame style:(UITableViewStyle) style  delegate:(id<UITableViewDelegate,UITableViewDataSource>) delegate;

/**
 *  创建线
 *
 *  @param style  样式
 *  @param length 长度
 *  @param origin 原点
 *
 *  @return 实例
 */
+(UIView*) createLine:(LineStyle) style  length:(float) length orgin:(CGPoint) origin color:(UIColor*) color;

@end
