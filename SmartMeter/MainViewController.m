//
//  MainViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/20.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "MainViewController.h"
#import "UserLocationViewController.h"
#import "defineFile.h"
@interface MainViewController ()

@end

@implementation MainViewController

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
    [self initView];
    // Do any additional setup after loading the view.
}

-(void)initNavi{
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 55, 33)];
    [backBtn setTitle:@"注销" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_n.png"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_p.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *backBtnItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backBtnItem;
}


-(void)initView{
    
}

-(void)viewDidLayoutSubviews{
    UIButton *lastBtn = (UIButton *)[self.scrollView viewWithTag:14];
    self.scrollView.contentSize = CGSizeMake(screenWidth, lastBtn.frame.origin.y+140);
    self.scrollView.frame = self.view.bounds;
    self.scrollView.scrollEnabled = YES;
}

//注销事件
-(void)logout{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (IBAction)collectionClick:(UIButton *)sender {
    if (sender.tag == 10) {
        //分组抄表
        [self performSegueWithIdentifier:@"groupMeterOrTableMaintenance" sender:@{@"isGroupMeterVC":@1}];
    }else if(sender.tag == 11){
        //指定抄表
        [self performSegueWithIdentifier:@"queryMeter" sender:nil];
    }else if(sender.tag == 12){
        //未抄查询
        [self performSegueWithIdentifier:@"unMeterQuery" sender:nil];
    }else if(sender.tag == 13){
        //气表维护
        [self performSegueWithIdentifier:@"groupMeterOrTableMaintenance" sender:@{@"isGroupMeterVC":@0}];
    }else if(sender.tag == 14){
        //统计
        [self performSegueWithIdentifier:@"statistics" sender:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"groupMeterOrTableMaintenance"]) {
        UserLocationViewController *userLocationVC = segue.destinationViewController;
        if ([sender[@"isGroupMeterVC"] isEqualToNumber:@1]) {
            userLocationVC.isGroupMeterVC = YES;
        }else{
            userLocationVC.isGroupMeterVC = NO;
        }
    }
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
