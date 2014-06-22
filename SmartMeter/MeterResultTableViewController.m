//
//  MeterResultTableViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/20.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "MeterResultTableViewController.h"
#import "MeterResultTableViewCell.h"
#import "MeterResultInDetailViewController.h"
@interface MeterResultTableViewController (){

}

@end

@implementation MeterResultTableViewController

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
    [[[UIAlertView alloc]initWithTitle:@"消息" message:@"抄表成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]show];
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
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MeterResultTableViewCell *cell = (MeterResultTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"meterResultCell"];
    cell.username.text = @"刘志";
    cell.roomNumber.text = @"101室";
    cell.meterResult.text = @"已抄";
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MeterResultInDetailViewController *meterResultInDetailVC = segue.destinationViewController;
    meterResultInDetailVC.isMeterBtnHidden = YES;
}

@end
