//
//  UserTableViewCell.m
//  SmartMeter
//
//  Created by qkong on 14/6/20.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
