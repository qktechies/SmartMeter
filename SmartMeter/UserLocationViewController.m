//
//  UserLocationViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/21.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "UserLocationViewController.h"
#import "UserListTableViewController.h"
@interface UserLocationViewController (){
    NSDictionary *testData;
    NSArray *nameList;
}

@end

@implementation UserLocationViewController

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
    nameList = @[@"community",@"building",@"unit"];
    testData = @{nameList[0]:@[@"甘家巷",@"炼油厂",@"小区3",@"小区4",@"小区5",@"小区6",@"小区7",@"小区8",@"小区9",@"小区10"],
                 nameList[1]:@[@"1#",@"2#",@"3#",@"4#",@"5#",@"6#",@"7#",@"8#",@"9#"],
                 nameList[2]:@[@"1单元",@"2单元",@"3单元",@"4单元",@"5单元",@"6单元",@"7单元",@"8单元"]};
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 55, 33)];
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureLocation) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_n.png"] forState:UIControlStateNormal];
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_p.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *sureBtnItem = [[UIBarButtonItem alloc]initWithCustomView:sureBtn];
    self.navigationItem.rightBarButtonItem = sureBtnItem;
}

-(void)sureLocation{
    if (self.isGroupMeterVC) {
        [self performSegueWithIdentifier:@"userListVC" sender:nil];
    }else{
        [self performSegueWithIdentifier:@"tableMaintenanceVC" sender:nil];
    }
}

-(void)backAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"userListVC"]) {
        UserListTableViewController *userListVC = segue.destinationViewController;
        NSInteger selectedCommunity = [self.locationPicker selectedRowInComponent:0];
        NSInteger selectedBuilding = [self.locationPicker selectedRowInComponent:1];
        NSInteger selectedUnit = [self.locationPicker selectedRowInComponent:2];
        NSString *locationStr = [NSString stringWithFormat:@"%@_%@_%@",
                                 [testData objectForKey:nameList[0]][selectedCommunity],
                                 [testData objectForKey:nameList[1]][selectedBuilding],
                                 [testData objectForKey:nameList[2]][selectedUnit]];
        userListVC.locationViewStr = locationStr;
    }else if ([segue.identifier isEqualToString:@"tableMaintenanceVC"]){
        
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *columnArray = (NSArray *)testData[nameList[component]];
    return  columnArray.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *columnArray = (NSArray *)testData[nameList[component]];
    return columnArray[row];
}

@end
