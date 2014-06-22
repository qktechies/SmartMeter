//
//  MeterResultTableViewCell.h
//  SmartMeter
//
//  Created by qkong on 14/6/20.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeterResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *roomNumber;

@property (weak, nonatomic) IBOutlet UILabel *meterResult;

@end
