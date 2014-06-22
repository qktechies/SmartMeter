//
//  UserLocationViewController.h
//  SmartMeter
//
//  Created by qkong on 14/6/21.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserLocationViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *locationPicker;

@property (assign,nonatomic) BOOL isGroupMeterVC;

@end
