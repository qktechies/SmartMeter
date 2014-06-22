//
//  LoginViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/19.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "LoginViewController.h"
#import "defineFile.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    [self initView];
    // Do any additional setup after loading the view.
}

-(void)initView{
    self.username.delegate = self;
    self.password.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginAction:(id)sender {
    if ([self.username.text isEqualToString:@""] && [self.password.text isEqualToString:@""]) {
        [self performSegueWithIdentifier:@"mainVC" sender:nil];
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (textField == self.username) {
        [self.password becomeFirstResponder];
    }
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (!IS_IPHONE5) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0];
        self.view.frame = CGRectMake(0, -80, screenWidth, screenHeight);
        [UIView commitAnimations];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (!IS_IPHONE5) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0];
        self.view.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        [UIView commitAnimations];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
