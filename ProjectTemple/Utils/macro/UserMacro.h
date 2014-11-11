//
//  UserMacro.h
//  ProjectTemple
//
//  Created by Mac on 14-5-27.
//  Copyright (c) 2014年 Mac. All rights reserved.
//


#define COMMON  [Common sharedInstance]

#define URL(_x_) [NSURL URLWithString:_x_]
#define APP_DELEGATE  [UIApplication sharedApplication].delegate
#define FONT(_x_)   [UIFont systemFontOfSize:_x_]
#define IMAGE_NAME(_name_)  [UIImage imageNamed:_name_]

//string formate
#define STRING_FROM_INT(_x_)  [NSString stringWithFormat:@"%d",_x_]
#define STRING_FROM_FLOAT(_x_)  [NSString stringWithFormat:@"%f",_x_]
#define STRING_FROM_LONGLONG(_x_)  [NSString stringWithFormat:@"%llu",_x_]

#define STR_FORMAT(_format_,...) [NSString stringWithFormat:FORMAT, ##__VA_ARGS__]


//property and string
#define STRING_FROM_VAR(_var_)          (@#_var_)

#define STRING_FROM_TARGET_PROPERTY(_target_,_property_)                (_target_._property_,STRING_FROM_VAR(_property_))
#define PROPERTY_SET_TARGET_VALUE(_target_,_property_str_,_value_)      (([_target_ valueForKeyPath:_property_str_])==(_value_) ?:[_target_ setValue:(_value_) forKeyPath:_property_str_])

#define STRING_FROM_PROPERTY(_property_)                                STRING_FROM_TARGET_PROPERTY(self,_property_)
#define PROPERTY_SET_VALUE(_property_str_,_value_)                      PROPERTY_SET_TARGET_VALUE(self,_property_str_,_value_)


//throw exception
#define THROW_EXCEPTION(_name_,_content_)                     @throw [NSException exceptionWithName:_name_ reason:_content_ userInfo:nil]
