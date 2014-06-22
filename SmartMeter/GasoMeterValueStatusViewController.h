//
//  GasoMeterValueStatusViewController.h
//  SmartMeter
//
//  Created by qkong on 14/6/22.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GasoMeterValueStatusViewController : UIViewController

@property (assign,nonatomic) BOOL isValueOn;

@property (weak, nonatomic) IBOutlet UILabel *valueMsg;

@property (weak, nonatomic) IBOutlet UILabel *valuStatus;

@end
