//
//  QueryMeterViewController.h
//  SmartMeter
//
//  Created by qkong on 14/6/21.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QueryMeterViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *tableNumber;


@end
