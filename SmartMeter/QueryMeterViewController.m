//
//  QueryMeterViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/21.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "QueryMeterViewController.h"
#import "defineFile.h"
#import "MeterResultInDetailViewController.h"
@interface QueryMeterViewController ()

@end

@implementation QueryMeterViewController

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
    //左边返回按钮
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 55, 33)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_n.png"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_p.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *backBtnItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backBtnItem;
}

-(void)initView{
    self.userName.delegate = self;
    self.tableNumber.delegate = self;
    self.tableNumber.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)queryUser:(id)sender {
    [self performSegueWithIdentifier:@"userInfoDetail" sender:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (!IS_IPHONE5) {
        if (textField == self.tableNumber) {
            [UIView beginAnimations:nil context:nil];
            self.view.frame = CGRectMake(0, -80, screenWidth, screenHeight);
            [UIView commitAnimations];
        }
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (!IS_IPHONE5) {
        if (textField == self.tableNumber) {
            [UIView beginAnimations:nil context:nil];
            self.view.frame = CGRectMake(0, 0, screenWidth, screenHeight);
            [UIView commitAnimations];
        }
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MeterResultInDetailViewController *meterResultInDetailVC = segue.destinationViewController;
    meterResultInDetailVC.isMeterBtnHidden = NO;
}

@end
