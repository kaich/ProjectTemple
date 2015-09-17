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
    CWStatusBarNotification * _statusbarNotification;
}
@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id)initWithViewModel:(BaseViewModel *)viewModel {
    return [self initWithViewModel:viewModel nibName:nil bundle:nil];
}

- (id)initWithViewModel:(BaseViewModel *)viewModel nibName:(NSString *)nibName bundle:(NSBundle *)bundle {
    self = [super initWithNibName:nibName bundle:bundle];
    if (self == nil) return nil;
    
    _viewModel = viewModel;
    
    RACSignal *presented = [[RACSignal
                             merge:@[
                                     [[self rac_signalForSelector:@selector(viewDidAppear:)] mapReplace:@YES],
                                     [[self rac_signalForSelector:@selector(viewWillDisappear:)] mapReplace:@NO]
                                     ]]
                            setNameWithFormat:@"%@ presented", self];
    
    RACSignal *appActive = [[[RACSignal
                              merge:@[
                                      [[NSNotificationCenter.defaultCenter rac_addObserverForName:UIApplicationDidBecomeActiveNotification object:nil] mapReplace:@YES],
                                      [[NSNotificationCenter.defaultCenter rac_addObserverForName:UIApplicationWillResignActiveNotification object:nil] mapReplace:@NO]
                                      ]]
                             startWith:@YES]
                            setNameWithFormat:@"%@ appActive", self];
    
    RAC(self, viewModel.active) = [[[RACSignal
                                     combineLatest:@[ presented, appActive ]]
                                    and]
                                   setNameWithFormat:@"%@ active", self];
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    @weakify(self);
    [[RACObserve(_viewModel, contentType) distinctUntilChanged] subscribeNext:^(NSNumber *  typeValue) {
        @strongify(self);
        StatusNotificationViewType  type = [typeValue integerValue];
        [self.contentStatusView removeFromSuperview];
        [self.view showStatusViewWithType:type];
        self.contentStatusView =(StatusNotificationView *)self.view.networkView;
        
        if(type==kSNNoNetwork)
        {
            [self showNetworkIssuStatusBarNotification];
        }
    }];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Custom Method


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
