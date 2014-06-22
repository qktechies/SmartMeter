//
//  TableMaintenanceUserListTableViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/22.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "TableMaintenanceUserListTableViewController.h"
#import "UserTableViewCell.h"
#import "GasoMeterValueStatusViewController.h"
#import "GasoMeterFrequencyViewController.h"
@interface TableMaintenanceUserListTableViewController (){
    NSArray *testData;
}

@end

@implementation TableMaintenanceUserListTableViewController

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
    testData = @[@{@"roomNum":@"101室",@"username":@"湖畔"},
                 @{@"roomNum":@"102室",@"username":@"刘志"},
                 @{@"roomNum":@"103室",@"username":@"王大师"},
                 @{@"roomNum":@"104室",@"username":@"刘红"},
                 @{@"roomNum":@"101室",@"username":@"杨飞"},
                 @{@"roomNum":@"101室",@"username":@"曹培华"}];
    
    
    //必须等待tableview加载完数据才能设置
    [self initView];
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

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //气表状态
        [self performSegueWithIdentifier:@"gasoMeterStatus" sender:nil];
    }else if(buttonIndex == 1){
        //设置开阀
        [self performSegueWithIdentifier:@"gasoMeterValue" sender:@{@"isValueON":@1}];
    }else if(buttonIndex == 2){
        //设置关阀
        [self performSegueWithIdentifier:@"gasoMeterValue" sender:@{@"isValueON":@0}];
    }else if(buttonIndex == 3){
        //设置次数
        UIAlertView *frequencyAlert = [[UIAlertView alloc]initWithTitle:@"请输入设置次数" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        frequencyAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField *frequencyField = [frequencyAlert textFieldAtIndex:0];
        frequencyField.keyboardType = UIKeyboardTypeNumberPad;
        [frequencyAlert show];
    }else if(buttonIndex == 4){
        //机电同步
        //[self performSegueWithIdentifier:@"" sender:nil];
    }else if(buttonIndex == 5){
        //设置单价
        //[self performSegueWithIdentifier:@"" sender:nil];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //设置次数
    UITextField *frequencyField = [alertView textFieldAtIndex:0];
    if (buttonIndex == 1) {
        //确认键跳转界面
        [self performSegueWithIdentifier:@"gasoMeterFrequency" sender:@{@"frequency":frequencyField.text}];
    }
}


-(void)initView{
    UIView *clearView = [UIView new];
    [clearView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setTableFooterView:clearView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"gasoMeterStatus"]) {
        
    }else if([segue.identifier isEqualToString:@"gasoMeterValue"]){
        GasoMeterValueStatusViewController *gasoMeterValueStatusVC = segue.destinationViewController;
        if ([sender[@"isValueON"] isEqualToNumber:@0]) {
            //设置关阀
            gasoMeterValueStatusVC.isValueOn = NO;
        }else{
            //设置开阀
            gasoMeterValueStatusVC.isValueOn = YES;
        }
    }else if ([segue.identifier isEqualToString:@"gasoMeterFrequency"]){
        GasoMeterFrequencyViewController *gasoMeterFrequencyVC = segue.destinationViewController;
        gasoMeterFrequencyVC.frequencyStr = sender[@"frequency"];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return testData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableMaintenanceUserCell"];
    cell.nameLabel.text = testData[indexPath.row][@"username"];
    cell.roomNumLabel.text = testData[indexPath.row][@"roomNum"];
    [cell.meterCheckBox setHidden:YES];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIActionSheet *menuList = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"气表状态",@"设置开阀",@"设置关阀",@"设置次数",@"机电同步",@"设置单价",nil];
    [menuList showInView:self.view];
}

@end
