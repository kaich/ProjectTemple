//
//  UserMacro.h
//  ProjectTemple
//
//  Created by Mac on 14-5-27.
//  Copyright (c) 2014年 Mac. All rights reserved.
//



#define URL(_x_) [NSURL URLWithString:_x_]
#define APP_DELEGATE  [UIApplication sharedApplication].delegate
#define FONT(_x_)   [UIFont systemFontOfSize:_x_]
#define IMAGE_NAME(_name_)  [UIImage imageNamed:_name_]


#define STRING_FROM_INT(_x_)  [NSString stringWithFormat:@"%d",_x_]
#define STRING_FROM_FLOAT(_x_)  [NSString stringWithFormat:@"%f",_x_]
#define STRING_FROM_LONGLONG(_x_)  [NSString stringWithFormat:@"%llu",_x_]