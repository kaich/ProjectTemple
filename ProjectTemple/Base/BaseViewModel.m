//
//  BaseViewModel.m
//  ProjectTemple
//
//  Created by mac on 14/11/18.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseViewModel ()
{
    PTHTTPRequestManager * _requestManager;
}
@end

@implementation BaseViewModel

-(instancetype) init
{
    self =[super init];
    if(self)
    {
        
    }
    
    return self;
}



//HTTP request
-(PTHTTPRequestManager*) requestManager
{
    if(!_requestManager)
    {
        _requestManager=[[PTHTTPRequestManager alloc] init];
    }
    
    return  _requestManager;
}

@end
