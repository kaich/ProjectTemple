//
//  CKAPPDetailViewController.m
//  ProjectTemple
//
//  Created by Mac on 14-5-29.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "CKAPPDetailViewController.h"
#import <ReactiveCocoa.h>
#import "CKDetailViewModel.h"
#import "RACEXTScope.h"
#import <UIImageView+WebCache.h>
#import "CKDetailTableViewCell.h"
#import <SVProgressHUD.h>


@interface CKAPPDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UIImageView * ivIcon;
@property(nonatomic,strong) UILabel * lblTitle;
@property(nonatomic,strong) UILabel * lblSize;
@property(nonatomic,strong) UILabel * lblPrice;
@property(nonatomic,strong) UITableView * tbScreenShots;

@property(nonatomic,strong) CKDetailViewModel * viewModel;
@end

@implementation CKAPPDetailViewController

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
    
    
    self.ivIcon=[UIFactory createImageViewWithFrame:CGRectMake(20, 20, 80, 80) imageName:nil];
    [self.view addSubview:self.ivIcon];
    
    
    self.lblTitle=[UIFactory createLabelWithTitle:@"1111111" frame:CGRectMake(30, 20, SCREEN_WIDTH-40-80, 12)];
    [self.view addSubview:self.lblTitle];


    self.lblSize=[UIFactory createLabelWithTitle:@"1111111" frame:CGRectMake(30, 40, SCREEN_WIDTH-40-80, 12)];
    [self.view addSubview:self.lblSize];
    
    self.lblPrice=[UIFactory createLabelWithTitle:@"1111111" frame:CGRectMake(30, 60, SCREEN_WIDTH-40-80, 12)];
    [self.view addSubview:self.lblSize];
    
    
    self.tbScreenShots=[UIFactory createHorizontalTableViewWithFrame:CGRectMake(0, 100, self.view.width,self.view.height-100) style:UITableViewStylePlain delegate:self];
    self.tbScreenShots.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.tbScreenShots];
    

    
    self.view.backgroundColor=[UIColor greenColor];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //this method use is not very right. To work right way ....
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    [[[self.requestManager rac_GET:@"/lookup" parameters:@{@"id" : @"444934666", @"country" : @"cn"}] catch:^RACSignal *(NSError *error) {
        
        [SVProgressHUD dismiss];
        [self showNetworkIssuStatusBarNotification];
        
        return [RACSignal empty];
    }] subscribeNext:^(PTResponse * response) {
        
        NSArray * models=response.result;
        self.viewModel=[[CKDetailViewModel alloc] initWithModel:[models firstObject]];
        self.lblTitle.text=self.viewModel.name;
        self.lblPrice.text=self.viewModel.price;
        self.lblSize.text=self.viewModel.size;
        @weakify(self);
        [RACObserve(self.viewModel, screenShots) subscribeNext:^(id x) {
            @strongify(self);
            [self.tbScreenShots reloadData];
        }];
        
        [RACObserve(self.viewModel, iconUrl) subscribeNext:^(id x) {
            @strongify(self);
            
            [self.ivIcon sd_setImageWithURL:self.viewModel.model.appIcon];
        }];
        [SVProgressHUD dismiss];

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



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.screenShots.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier=@"UITableViewCell";
    CKDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        cell=[[CKDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.transform=CGAffineTransformMakeRotation(-M_PI/2);
    }
    

    
    NSURL * url=[self.viewModel.screenShots objectAtIndex:indexPath.row];
    [cell.ivScreenShot sd_setImageWithURL:url];
    cell.ivScreenShot.backgroundColor=[UIColor redColor];
    
    
    return cell;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  self.view.width;
}

#pragma mark - Overide Method 
-(BOOL) isNeedHTTPRequestManager
{
    return YES;
}


@end
