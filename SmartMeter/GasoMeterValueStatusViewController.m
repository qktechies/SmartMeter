//
//  GasoMeterValueStatusViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/22.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "GasoMeterValueStatusViewController.h"

@interface GasoMeterValueStatusViewController ()

@end

@implementation GasoMeterValueStatusViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNavi];
    
    if (self.isValueOn == YES) {
        self.valueMsg.text = @"开阀指令已接受";
        self.valuStatus.text = @"阀门正常－阀门开启";
    }else{
        self.valueMsg.text = @"关阀指令已接受";
        self.valuStatus.text = @"阀门正常－阀门关闭";
    }
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
