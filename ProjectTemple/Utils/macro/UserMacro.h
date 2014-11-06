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


//var and string
#define STRING_FROM_PROPERTY(_property_)        (self._property_, @#_property_)
#define PROPERTY_SET_VALUE(_property_,_value_)  (([self valueForKeyPath:_property_])==(_value_) ?:[self setValue:(_value_) forKeyPath:_property_])

//config
CONFIG_SET(_config_item_,_config_dic_)         

#define APPLY_CONFIG_ITEM_IN_DIC(_dic_)         \
                                                for (NSString * __emKey in config.allKeys) { \
                                                NSString * __value=[config objectForKey:__emKey]; \
                                                PROPERTY_SET_VALUE(__emKey, __value); \
                                                }
