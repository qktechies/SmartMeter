//
//  UserListTableViewController.m
//  SmartMeter
//
//  Created by qkong on 14/6/20.
//  Copyright (c) 2014 com. All rights reserved.
//

#import "UserListTableViewController.h"
#import "defineFile.h"
#import "UserTableViewCell.h"
@interface UserListTableViewController (){
    NSDictionary *userListData;
    NSArray *groupListName;
}

@end

@implementation UserListTableViewController

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
    [self initView];
    groupListName = [[NSArray alloc] initWithObjects:@"unMeterArray",@"alreadyMeterArray", nil];
    userListData = @{
                 groupListName[0]:@[@{@"roomNum":@"101室",@"name":@"刘志",@"result":@"未抄"},
                                  @{@"roomNum":@"102室",@"name":@"刘志1",@"result":@"未抄"},
                                  @{@"roomNum":@"103室",@"name":@"刘志2",@"result":@"未抄"},
                                  @{@"roomNum":@"104室",@"name":@"刘志3",@"result":@"未抄"}],
                 groupListName[1]:@[@{@"roomNum":@"105室",@"name":@"刘志4",@"result":@"已抄"},
                                        @{@"roomNum":@"106室",@"name":@"刘志5",@"result":@"已抄"},
                                        @{@"roomNum":@"107室",@"name":@"刘志6",@"result":@"已抄"}]
                 };
    
    UIView *clearView = [UIView new];
    [clearView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setTableFooterView:clearView];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)initNavi{
    //左边返回按钮
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 55, 33)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_n.png"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_p.png"] forState:UIControlStateHighlighted];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtnItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backBtnItem;
    
    //右边抄表按钮
    UIButton *meterBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 55, 33)];
    [meterBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_n.png"] forState:UIControlStateNormal];
    [meterBtn setBackgroundImage:[UIImage imageNamed:@"title_back_bg_p.png"] forState:UIControlStateHighlighted];
    [meterBtn setTitle:@"抄表" forState:UIControlStateNormal];
    [meterBtn addTarget:self action:@selector(meterWithGroups) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *meterBtnItem = [[UIBarButtonItem alloc]initWithCustomView:meterBtn];
    self.navigationItem.rightBarButtonItem = meterBtnItem;
    
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)initView{
    //清除tableview底部空白
    
    UIButton *titleLabel = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    [titleLabel setTitle:@"用户列表" forState:UIControlStateNormal];
    [titleLabel setTintColor:[UIColor whiteColor]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel addTarget:self action:@selector(showlocation) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleLabel;
    
    //显示地址
    self.locationView = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth/2-90, 40, 180, 40)];
    [self.locationView setBackgroundColor:[UIColor greenColor]];
    self.locationView.layer.cornerRadius = 10;
    self.locationView.text = self.locationViewStr;
    self.locationView.textAlignment = NSTextAlignmentCenter;
    [self.navigationController.navigationBar addSubview:self.locationView];
    [self.locationView setHidden:YES];

}

-(void)showlocation{
    if (self.locationView.isHidden) {
        [self.locationView setHidden:NO];
    }else{
        [self.locationView setHidden:YES];
    }
}

-(void)meterWithGroups{
    [self performSegueWithIdentifier:@"meterResult" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return groupListName.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth, 0, screenWidth, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
    [label setBackgroundColor:[UIColor grayColor]];
    if (section == 0) {
        label.text = @"未抄送";
        [label setTextColor:[UIColor redColor]];
    }else{
        label.text = @"已抄送";
        [label setTextColor:[UIColor greenColor]];
    }
    return label;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSString *groupName = groupListName[section];
    NSArray *listItems = [userListData objectForKey:groupName];
    return listItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    NSString *groupName = groupListName[section];
    NSArray *listItems = [userListData objectForKey:groupName];
    cell.nameLabel.text = listItems[row][@"name"];
    cell.roomNumLabel.text = listItems[row][@"roomNum"];
    if (section != unMeterSection) {
        [cell.meterCheckBox setHidden:YES];
    }
    [cell.meterCheckBox setBackgroundColor:[UIColor clearColor]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserTableViewCell *cell = (UserTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == unMeterSection) {
        [cell.meterCheckBox setSelected:!cell.meterCheckBox.selected];
    }
    if(cell.meterCheckBox.selected){
        [cell setBackgroundColor:[UIColor colorWithRed:255.0f/255.0 green:251.0f/255.0 blue:244.0f/255.0 alpha:1.0]];
    }else{
        [cell setBackgroundColor:[UIColor colorWithRed:245.0f/255.0 green:245.0f/255.0 blue:245.0f/255.0 alpha:1.0]];
    }
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
