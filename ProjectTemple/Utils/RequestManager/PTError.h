//
//  PTError.h
//  ProjectTemple
//
//  Created by mac on 14/11/6.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTLModel.h"
#import "Common.h"

@interface PTError : MTLModel
//network status
@property(nonatomic,assign) PTNetworkReachabilityStatus networkStatus;
//error message from server
@property(nonatomic,strong) NSString * message;


+(PTError *) networkError;
+(PTError *) timeOutError;

@end
