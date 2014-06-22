//
//  UserTableViewCell.h
//  SmartMeter
//
//  Created by qkong on 14/6/20.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *roomNumLabel;

@property (weak, nonatomic) IBOutlet UIButton *meterCheckBox;

@end
