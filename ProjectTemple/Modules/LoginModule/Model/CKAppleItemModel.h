//
//  CKAppleItemModel.h
//  ProjectTemple
//
//  Created by Mac on 14-5-26.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "MTLModel.h"
#import <MTLJSONAdapter.h>

@interface CKAppleItemModel : MTLModel<MTLJSONSerializing>
@property(nonatomic,strong) NSString * appName;
@property(nonatomic,strong) NSString * appVersion;
@property(nonatomic,strong) NSString * appPrice;
@property(nonatomic,strong) NSString * appSize;


@end
