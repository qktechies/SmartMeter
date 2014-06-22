//
//  MeterResultInDetailViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/21.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "MeterResultInDetailViewController.h"
@interface MeterResultInDetailViewController ()

@end

@implementation MeterResultInDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNavi];
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
    
    //右边确认按钮
    if (!self.isMeterBtnHidden) {
        UIButton *meterBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 55, 33)];
        [meterBtn setTitle:@"抄表" forState:UIControlStateNormal];
        [meterBtn addTarget:self action:@selector(meterAction) forControlEvents:UIControlEventTouchUpInside];
        [meterBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_n.png"] forState:UIControlStateNormal];
        [meterBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_p.png"] forState:UIControlStateHighlighted];
        UIBarButtonItem *sureBtnItem = [[UIBarButtonItem alloc]initWithCustomView:meterBtn];
        self.navigationItem.rightBarButtonItem = sureBtnItem;

    }
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)meterAction{
    [[[UIAlertView alloc]initWithTitle:@"消息" message:@"抄表成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]show];
}

@end
