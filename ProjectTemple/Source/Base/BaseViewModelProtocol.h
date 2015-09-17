//
//  BaseViewModelProtocol.h
//  ProjectTemple
//
//  Created by mac on 15/9/17.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZNEmptyEntity.h"

@protocol BaseViewModelProtocol <NSObject>

@optional
- (void) configRequestManagerBeforeSend;

- (DZNEmptyEntity *) emptyDataSetEntityWhenNoNetwork;

- (DZNEmptyEntity *) emptyDataSetEntityWhenNoData;
@end
