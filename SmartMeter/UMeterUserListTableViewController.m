//
//  UMeterUserListTableViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/22.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "UMeterUserListTableViewController.h"
#import "UMeterUserTableViewCell.h"
#import "MeterResultInDetailViewController.h"
@interface UMeterUserListTableViewController (){
    NSArray *testData;
}

@end

@implementation UMeterUserListTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNavi];
    testData = @[@{@"username":@"张丽",@"userLocation":@"2#2单元201室"},
                 @{@"username":@"王海",@"userLocation":@"2#2单元201室"},
                 @{@"username":@"王晓理",@"userLocation":@"2#2单元201室"},
                 @{@"username":@"杜海",@"userLocation":@"2#2单元201室"},
                 @{@"username":@"清气",@"userLocation":@"2#2单元201室"},
                 @{@"username":@"夏宝龙",@"userLocation":@"2#2单元201室"},
                 @{@"username":@"王辉中",@"userLocation":@"2#2单元201室"},
                 @{@"username":@"黄坤",@"userLocation":@"2#2单元201室"}];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)initNavi{
    //左边返回按钮
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 55, 33)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_n.png"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_p.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *backBtnItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backBtnItem;
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return testData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UMeterUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"uMeterUserCell"];
    cell.username.text = testData[indexPath.row][@"username"];
    cell.userLocation.text = testData[indexPath.row][@"userLocation"];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MeterResultInDetailViewController *meterResultInDetailViewVC = segue.destinationViewController;
    meterResultInDetailViewVC.isMeterBtnHidden = NO;
}

@end
