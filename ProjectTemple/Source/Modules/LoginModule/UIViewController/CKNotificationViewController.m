//
//  CKNotificationViewController.m
//  ProjectTemple
//
//  Created by mac on 15/9/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CKNotificationViewController.h"

@interface CKNotificationViewController ()

@end

@implementation CKNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView triggerPullToRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
