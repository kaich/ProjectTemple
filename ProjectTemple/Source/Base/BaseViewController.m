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


#pragma mark - DZNEmptyDataSetSource and DZNEmptyDataSetDelegate
-(BOOL) emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    if(self.scrollView == scrollView)
    {
        BOOL isEmptyVisible = self.viewModel.contentType == kSNNoData || self.viewModel.contentType == kSNNoNetwork || self.viewModel.contentType == kSNNoDataLoading;
        return isEmptyVisible;
    }
    else
    {
        return NO;
    }
}

-(BOOL) emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    if(self.scrollView == scrollView)
    {
        return self.viewModel.contentType == kSNNoDataLoading;
    }
    else
    {
        return NO;
    }
}

-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    return  self.viewModel.emptyDataSetEntity.title;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.viewModel.emptyDataSetEntity.emptyDescription;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return ImageNamed(self.viewModel.emptyDataSetEntity.imageName);
}

- (UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.viewModel.emptyDataSetEntity.imageTintColor;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [self.viewModel.emptyDataSetEntity.buttonTitle objectForKey:@(state)]?:[self.viewModel.emptyDataSetEntity.buttonTitle objectForKey:@(UIControlStateNormal)];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [self.viewModel.emptyDataSetEntity.buttonImage objectForKey:@(state)]?:[self.viewModel.emptyDataSetEntity.buttonImage objectForKey:@(UIControlStateNormal)];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [self.viewModel.emptyDataSetEntity.buttonBackgroundImage objectForKey:@(state)]?:[self.viewModel.emptyDataSetEntity.buttonBackgroundImage objectForKey:@(UIControlStateNormal)];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.viewModel.emptyDataSetEntity.backgroundColor;
}

- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    self.viewModel.contentType = kSNNoDataLoading;
    [self.viewModel.refreshDataSource execute:nil];
}

- (CAAnimation *) imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}
@end
