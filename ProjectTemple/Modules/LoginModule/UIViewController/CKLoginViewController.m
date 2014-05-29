//
//  CKLoginViewController.m
//  ProjectTemple
//
//  Created by Mac on 14-5-16.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "CKLoginViewController.h"
#import <ReactiveCocoaLayout.h>
#import "CKLoginViewModel.h"
#import <Overcoat.h>
#import "CKAppleItemModel.h"
#import <InAppSettingsKit/IASKAppSettingsViewController.h>
#import <SVProgressHUD.h>

@interface CKLoginViewController ()<IASKSettingsDelegate>
@property(nonatomic,strong) UITextField * tfUserName;
@property(nonatomic,strong) UITextField * tfPassword;
@property(nonatomic,strong) UIButton *  btnLogin;
@property(nonatomic,strong) CKLoginViewModel * viewModel;
@end


@implementation CKLoginViewController

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

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tfUserName=[UIFactory createTextFieldWithPlaceholder:NSLocalizedString(@"Login_UserName", nil)  frame:CGRectMake(20, 40, SCREEN_WIDTH-40, 30)];
    [self.view addSubview:self.tfUserName];
    
    self.tfPassword=[UIFactory createTextFieldWithPlaceholder:NSLocalizedString(@"Login_Password", nil) frame:CGRectZero];
    RCLFrame(self.tfPassword)=@{rcl_rect:[self.tfUserName.rcl_frameSignal moveDown:[RACSignal add:@[self.tfUserName.rcl_frameSignal.height,RCLBox(10)]]]};
    [self.view addSubview:self.tfPassword];
    
    
    self.btnLogin=[UIFactory createButtonWithTitle:@"登陆" backgroundImageName:nil normalImageName:nil highlightImageName:nil];
    RCLFrame(self.btnLogin)=@{rcl_top: [RACSignal add:@[self.tfPassword.rcl_frameSignal.bottom,RCLBox(30)]],
                              rcl_width : self.tfPassword.rcl_frameSignal.width,
                              rcl_height : @40
                              };
    [self.view addSubview:self.btnLogin];
    
    self.viewModel=[[CKLoginViewModel alloc] init];
    RAC(self.viewModel,userName)=self.tfUserName.rac_textSignal;
    RAC(self.viewModel,password)=self.tfPassword.rac_textSignal;
    self.btnLogin.rac_command=self.viewModel.loginCommand;
    

    
    
    [[self.viewModel.loginCommand.executionSignals flattenMap:^RACStream *(id value) {
        return [[value ignoreValues] concat:[RACSignal return:@"1"]];
    }] subscribeNext:^(id x) {

        if([x intValue]==1)
        {
            [SVProgressHUD showWithStatus:@"加载中..."];
            OVCClient * client=[OVCClient clientWithBaseURL:URL(@"https://itunes.apple.com") account:nil];
            [client GET:@"/lookup" parameters:@{@"id" : @"444934666", @"country" : @"cn"} resultClass:[CKAppleItemModel class] resultKeyPath:@"results" completion:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
                
                [SVProgressHUD dismiss];
                UIAlertView * alert=[[UIAlertView alloc] initWithTitle:@"ceshi" message:[NSString stringWithFormat:@"%@",responseObject] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
            }];
        }
        else
        {
            IASKAppSettingsViewController * settingVC=[[IASKAppSettingsViewController alloc] init];
            settingVC.showDoneButton=YES;
            settingVC.delegate=self;
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController:settingVC] animated:YES completion:nil];
        }
    }];
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark -  IASSeetingViewController delegate 
- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController*)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
