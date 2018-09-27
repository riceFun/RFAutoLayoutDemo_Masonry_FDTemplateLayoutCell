//
//  RFBaseMacroHeader.h
//  TFunnyRock
//
//  Created by riceFun on 2018/9/4.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#ifndef RFBaseMacroHeader_h
#define RFBaseMacroHeader_h

//尺寸 measurement
#define KScreenFrame [[UIScreen mainScreen] bounds]  // 当前屏幕frmae
#define KScreenWidth KScreenFrame.size.width          // 当前屏幕宽度
#define KScreenHeight KScreenFrame.size.height        // 当前屏幕高度
#define KAUTOSCALE(num) ((KScreenWidth/375)*num)     //适配 以苹果6为基准

#define K_NaviBar_height   (kDevice_Is_iPhoneX ? 88 : 64)
#define K_Navibar_extraheight (kDevice_Is_iPhoneX ? 24 : 0)
#define K_StatusBar_height ([UIApplication sharedApplication].statusBarFrame.size.height)
#define K_tabbar_extraheight (kDevice_Is_iPhoneX ? 34 : 0)
#define K_tabbar_height (kDevice_Is_iPhoneX ? 83 : 49)

#define K_CornerRadius 3

//机型判断
// 判断是否为4s
#define KiPhone4S ([[UIScreen mainScreen] bounds].size.height < 500.0f)
// 判断是否为 iPhone 5/5S/SE
#define KiPhone5_SE ([[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f)
// 判断是否为iPhone 6/6s/7/8
#define KiPhone6_6s_7_8 ([[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f)
// 判断是否为iPhone 6Plus/6sPlus/7Plus/8Plus
#define KiPhone6Plus_6sPlus_7plus_8plus ([[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f)
// 判断是否为iPhone X
#define KiPhoneX (KScreenWidth == 375.f && KScreenHeight == 812.f)


//颜色 color
#define KRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]      // RGB颜色值（带透明度）
#define KRGB(r,g,b) KRGBA(r,g,b,1.0f)     // RGB颜色值（不透明）
#define KHexColor(hexStr) [UIColor colorWithHexString:hexStr]
#define KHexColor_A(hexStr,alpha) [UIColor colorWithHexString:hexStr alpha:alpha]
#define KRandomColor     [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define KThemeColor KRGB(55,70,92)//主题色
#define KMianBgColor KRGB(242,242,242)
#define KNavibarTextColor [UIColor whiteColor]
#define KTitleColor KHexColor(@"#333333")

//字体 font
#define KFont(font) [UIFont systemFontOfSize:KAUTOSCALE(font)]

//函数 function
#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] "fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...)
#endif

#define jjjj NSLog(@"调试用。正在打印*********");

#define KWeakSelf __weak typeof(self) weakSelf = self;

#define KNSLocalString(key)   NSLocalizedString(key, nil)//字符串国际化

#define KBUTTON_TARGET(button,selectorName) [button addTarget:self action:@selector(selectorName:) forControlEvents:UIControlEventTouchUpInside]
#define KBUTTON_TARGET_DOWN(button,selectorName) [button addTarget:self action:@selector(selectorName:) forControlEvents:UIControlEventTouchDown]

#define KUIIMAGE(imageName) [UIImage imageNamed:imageName]

/**
 主线程运行
 */
#define DISPATCH_ASYNC_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

/**
 后台返回data判空
 */
#define kresultData(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 || [str isEqualToString:@"<null>"] || [str isEqualToString:@"(null)"] ? YES : NO )



#endif /* RFBaseMacroHeader_h */
