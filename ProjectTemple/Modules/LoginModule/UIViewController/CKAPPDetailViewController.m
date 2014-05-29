//
//  CKAPPDetailViewController.m
//  ProjectTemple
//
//  Created by Mac on 14-5-29.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "CKAPPDetailViewController.h"
#import <ReactiveCocoaLayout.h>
#import <ReactiveCocoa.h>
#import "CKDetailViewModel.h"
#import "RACEXTScope.h"
#import <UIImageView+WebCache.h>
#import "CKDetailTableViewCell.h"
#import <SVProgressHUD.h>
#import <Overcoat.h>

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
    
    
    self.lblTitle=[UIFactory createLabelWithTitle:@"1111111" frame:CGRectMake(0, 0, SCREEN_WIDTH-40-80, 12)];
    RCLFrame(self.lblTitle)=@{rcl_top: self.ivIcon.rcl_frameSignal.top,
                              };
    [self.view addSubview:self.lblTitle];
//
//    self.lblSize=[UIFactory createLabelWithTitle:@"1111111" frame:CGRectZero];
//    RCLFrame(self.lblSize)=@{rcl_rect: [self.lblTitle.rcl_frameSignal moveDown:self.lblTitle.rcl_frameSignal.height]};
//    [self.view addSubview:self.lblSize];
//    
//    self.lblPrice=[UIFactory createLabelWithTitle:@"1111111" frame:CGRectZero];
//    RCLFrame(self.lblPrice)=@{rcl_rect: [self.lblSize.rcl_frameSignal moveDown:self.lblSize.rcl_frameSignal.height]};
//    [self.view addSubview:self.lblSize];
//    
//    
//    self.tbScreenShots=[UIFactory createHorizontalTableViewWithFrame:CGRectMake(0, 100, 0, SCREEN_WIDTH) style:UITableViewStylePlain delegate:self];
//    RCLFrame(self.tbScreenShots)=@{rcl_top: [RACSignal add:@[self.lblPrice.rcl_frameSignal.bottom,RCLBox(20)]],
//                                   rcl_bottom: @20,
//                                   };
//    self.tbScreenShots.backgroundColor=[UIColor redColor];
//    [self.view addSubview:self.tbScreenShots];
//    
    
    self.viewModel=[[CKDetailViewModel alloc] init];
    self.view.backgroundColor=[UIColor greenColor];

    
    [RACObserve(self.lblTitle, frame) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    @weakify(self);
    [RACObserve(self.viewModel, iconUrl) subscribeNext:^(id x) {
        @strongify(self);
        
        [self.ivIcon setImageWithURL:self.viewModel.model.appIcon];
        
    }];
    
    RAC(self.lblTitle, text)=RACObserve(self.viewModel, name);
    RAC(self.lblPrice, text)=RACObserve(self.viewModel, price);
    RAC(self.lblSize, text)=RACObserve(self.viewModel, size);
    
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    OVCClient * client=[OVCClient clientWithBaseURL:URL(@"https://itunes.apple.com") account:nil];
    [client GET:@"/lookup" parameters:@{@"id" : @"444934666", @"country" : @"cn"} resultClass:[CKAppleItemModel class] resultKeyPath:@"results" completion:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        
        NSLog(@"%@",responseObject);
        
        [SVProgressHUD dismiss];
        self.viewModel.model=responseObject;
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
        cell.transform=CGAffineTransformMakeRotation(M_PI/2);
    }
    
    NSURL * url=[self.viewModel.screenShots objectAtIndex:indexPath.row];
    [cell.ivScreenShot setImageWithURL:url];
    
    return cell;
}





@end
