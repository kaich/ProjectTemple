//
//  BaseViewController.m
//  ProjectTemple
//
//  Created by Mac on 14-5-16.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()
{
    PTHTTPRequestManager * _requestManager;
    CWStatusBarNotification * _statusbarNotification;
}
@end

@implementation BaseViewController
@dynamic requestManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) loadView
{
    [super loadView];
    
    self.view.backgroundColor=[UIColor whiteColor];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Custom Method

//HTTP request
-(PTHTTPRequestManager*) requestManager
{
    if(!_requestManager)
    {
        _requestManager=[[PTHTTPRequestManager alloc] init];
    }
    
    return  _requestManager;
}



//Show Status bar notification
-(CWStatusBarNotification *) statusbarNotification
{
    if(!_statusbarNotification)
    {
        _statusbarNotification=[UIFactory createStatusBarNotification];
    }
    
    return _statusbarNotification;
}


-(void) showNetworkIssuStatusBarNotification
{
    [self.statusbarNotification displayNotificationWithMessage:@"网络状态异常，请检查网络连接！" forDuration:3];
}


@end
