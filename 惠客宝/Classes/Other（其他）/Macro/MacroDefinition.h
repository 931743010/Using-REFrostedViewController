//
//  MacroDefinition.h
//  SLPay
//
//  Created by Hebert on 15/4/2.
//  Copyright (c) 2015年 Neighbours. All rights reserved.
//

#ifndef SLPay_MacroDefinition_h
#define SLPay_MacroDefinition_h

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenSize [UIScreen mainScreen].bounds.size

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


//导航条高度
#define SEBNavH self.navigationController.navigationBar.height
//状态栏高度
#define SEBStatusBarH [UIApplication sharedApplication].statusBarFrame.size.height
//导航栏高度
#define SEBTabBarH self.tabBarController.tabBar.height
//广告条的高度
#define SEBAdvertismentHeight (ScreenH - (SEBNavHeight + SEBStatusBarH) - self.tabBar.height) / 3.0f
//通知
#define SEBNotificationCenter [NSNotificationCenter defaultCenter]

//宽高比计算
#define heightRate(height) SCREEN_HEIGHT*(height/1920.0)
#define weightRate(weight) SCREEN_WIDTH*(weight/1080.0)

/**
 iOS设备宽高比
 4\4s {320, 480}  5s\5c {320, 568}  6 {375, 667}  6+ {414, 736}
 0.66             0.56              0.56          0.56
 */
#define ios7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define ios8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define ios6 ([[UIDevice currentDevice].systemVersion doubleValue] >= 6.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 7.0)
#define ios5 ([[UIDevice currentDevice].systemVersion doubleValue] < 6.0)
#define iphone5  ([UIScreen mainScreen].bounds.size.height == 568)
#define iphone6  ([UIScreen mainScreen].bounds.size.height == 667)
#define iphone6Plus  ([UIScreen mainScreen].bounds.size.height == 736)
#define iphone4  ([UIScreen mainScreen].bounds.size.height == 480)
#define ipadMini2  ([UIScreen mainScreen].bounds.size.height == 1024)



//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define NLLogger_info(s, ... ) NSLog( @"INFO: <%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] );
#define NLLogger_error(s, ... ) NSLog( @"ERROR: <%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] );
//----------------------系统----------------------------

//获取系统版本
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]
#define CurrentAPPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define CurrentAPPBundleIdentifier [[NSBundle mainBundle] bundleIdentifier]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//----------------------图片----------------------------

//读取本地图片
#define LOADLocalIMAGE(file) [UIImage imageWithContentsOfFile:file]

#define LOADResourceIMAGE(name) [UIImage imageNamed:name]



//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//背景色
#define BACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]

//清除背景色
#define CLEARCOLOR [UIColor clearColor]

//RGB 颜色
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//颜色
#define SEBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LightBlue RGBACOLOR(44,187,251,1.0)
#define WhiteColor [UIColor whiteColor]
//----------------------颜色类--------------------------

//弱引用self
#define WeakSelf __weak typeof(self)  weakSelf = self

#define INTF_SHARED_INSTANCE + (instancetype)sharedInstance;

#define IMPL_SHARED_INSTANCE \
+ (id)sharedInstance \
{ \
static dispatch_once_t once; \
static id instance = nil; \
dispatch_once( &once, ^{ instance = [[self alloc] init]; } ); \
return instance; \
}

#define MainPerform(target,action,object) [target performSelectorOnMainThread:action withObject:object waitUntilDone:NO]
#define MainIfPerform(target,action,object) if (target && [target respondsToSelector:action]) {MainPerform(target,action,object);}
#define SS_Default_Device_Name_KEY @"com.neighbours.SLPay.default_device"



#endif
