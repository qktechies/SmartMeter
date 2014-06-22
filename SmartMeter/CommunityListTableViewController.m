//
//  CommunityListTableViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/22.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "CommunityListTableViewController.h"

@interface CommunityListTableViewController (){
    NSArray *testData;
}

@end

@implementation CommunityListTableViewController

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
    testData = @[@"甘家巷",@"炼油厂",@"小区3",@"小区4",@"小区5",@"小区6",@"小区7",@"小区8"];
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
    return  testData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommunityCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommunityCell"];
    }
    
    cell.textLabel.text = testData[indexPath.row];
    return cell;
}

@end
