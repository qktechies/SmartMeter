//
//  defineFile.h
//  SmartMeter
//
//  Created by qkong on 14/6/20.
//  Copyright (c) 2014年 com. All rights reserved.
//


#define screenWidth [UIScreen mainScreen].bounds.size.width //屏幕宽度
#define screenHeight [UIScreen mainScreen].bounds.size.height //屏幕高度
# define IS_IPHONE5  ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )//判断是否为iphone5

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define chineseKeyBoardHeight 252.0f

#define unMeterSection 0
#define alreadyMeterSection 1

