//
//  PATheme.h
//  PAQZZ
//
//  Created by Lex on 9/2/13.
//  Copyright (c) 2013 平安付. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef PA_THEME
#define PA_THEME
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define kForegroundColor [UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f]
#define kBackgroundColor UIColorFromRGB(0xf5f5f5)
#define kTableViewCellBorderColor [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.00f]


#define kFormBackgroundColor [UIColor whiteColor]
#define kFormBorderColor [UIColor colorWithRed:0.78f green:0.78f blue:0.78f alpha:1.00f]
#define kSeparateLineColor [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f]
#define kLinkColor [UIColor colorWithRed:0.15f green:0.51f blue:0.76f alpha:1.00f]
#define kTextFieldBorderColor [UIColor colorWithRed:0.78f green:0.78f blue:0.78f alpha:1.00f]
#define kTextFieldErrorBorderColor [UIColor colorWithRed:1.00f green:0.55f blue:0.16f alpha:1.00f]

//导航栏相关
#define kNavigationTitleColor [UIColor whiteColor]
#define pBackArrowImageName @"back_white"
#define pNavigationImageName     isIOS7AndBeyond()?@"navigation_bg-568h":@"navigation_bg"
#define kBarCancelButtonTitleColor [UIColor whiteColor]

//新版navigationbarUI
#define kNavigationTitleColor_new UIColorFromRGB(0x1d1d1d)
#define pBackArrowImageName_new @"back_black"
#define pNavigationImageName_new isIOS7AndBeyond()?@"navigation_bg_new_568h":@"navigation_bg_new"
#define kBarCancelButtonTitleColor_new UIColorFromRGB(0x1d1d1d)
#define kBarRightButtonTitleColor_new UIColorFromRGB(0x1d1d1d)


#define kCellColor UIColorFromRGB(0xf9f9f9)//cell 背景色色值
#define kMainColor UIColorFromRGB(0x36ccc0)//主色
#define kTextColor UIColorFromRGB(0xfffff)//默认文字颜色
#define kVersionControllerNoticeLabelColor UIColorFromRGB(0x659f5b)//版本更新label色
#define kButtonDisableColor UIColorFromRGB(0xebeaea)//按钮不可用色
#define kButtonDisableTitleColor UIColorFromRGB(0xcacaca)//按钮不可用时title色

#define kLinkButtonTextColor UIColorFromRGB(0x0087e3)//linkButton文字颜色

#define kSpecialTextColor UIColorFromRGB(0xff7588)//提示色，所有彩色button，金额数值颜色
#define kNormalLabelColor UIColorFromRGB(0x4e4e4e) //label 常规颜色
#define kLineColor UIColorFromRGB(0xcccccc)//line color

#define kYQLeftBackGroundColor UIColorFromRGB(0x7daeaf)//侧边栏背景色
#define kYQFootBackGroundColor UIColorFromRGB(0x60aea0)//底栏背景色
#define kYQSelectItemColor UIColorFromRGBA(0xdcdcdc,0.3)//选中栏蒙层颜色

#define kMoneyNumberColor UIColorFromRGB(0xff7588)//所有金额数字颜色,金额文本用boldsystem,记得加粗

#define kNavigationBarTitleFont [UIFont boldSystemFontOfSize:17] //标题字体
#define kCellDefaultTextFont [UIFont fontWithName:@"Heiti TC" size:16]//默认cell 字体

#endif