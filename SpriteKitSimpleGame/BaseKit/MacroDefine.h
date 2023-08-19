//
//  UtilMacro.h
//  QKiOS
//
//  Created by syxiaqj on 15/6/9.
//  Copyright (c) 2015年 qingka. All rights reserved.
//

#ifndef QKiOS_UtilMacro_h
#define QKiOS_UtilMacro_h

#import <AdSupport/ASIdentifierManager.h>

//*************************************************************************//
//*************************************************************************//

#pragma mark - Notification

#define PostNotification(name, obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj]
#define PostNotification2(name, obj, info) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:info]

//*************************************************************************//
//*************************************************************************//
#pragma mark - Device

#define AppWindow [UIApplication sharedApplication].keyWindow
#define WINDOW [[[UIApplication sharedApplication] delegate] window]

#define ScreenWidth     ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight    ([UIScreen mainScreen].bounds.size.height)
#define ScreenKeyWindow ([UIApplication sharedApplication].keyWindow)
#define SWScaleFromInch47   (ScreenWidth / 375.0)       //屏幕宽相对于4.7寸屏的缩放比例
#define SWScaleFromInch55   (ScreenWidth / 414.0)       //屏幕宽相对于5.5寸屏的缩放比例
//#define NavigationBarHeight (DeviceiPhoneX ? 88.0 : 64.0)
//#define TabBarHeight (DeviceiPhoneX ? (49.0 + 34.0) : 49.0)
//#define TabBarSafeInsetHeight (DeviceiPhoneX ?  34.0 : 0.0)
//#define StatusBarHeight (DeviceiPhoneX ? 44.0 : 20.0)
//#define StatusBarSafeInsetHeight (DeviceiPhoneX ? 20.0: 0.0)

//#define DeviceiPhoneX ((([UIScreen mainScreen].bounds.size.height == 812) && ([UIScreen mainScreen].bounds.size.width == 375))\
|| (([UIScreen mainScreen].bounds.size.height == 896) && ([UIScreen mainScreen].bounds.size.width == 414)) || (([UIScreen mainScreen].bounds.size.height == 926) && ([UIScreen mainScreen].bounds.size.width == 428)) || (([UIScreen mainScreen].bounds.size.height == 844) && ([UIScreen mainScreen].bounds.size.width == 390)))

#define NavigationBarHeight UIWindow.safeNavigationBarHeight
#define TabBarHeight UIWindow.safeTabBarHeight
#define TabBarSafeInsetHeight UIWindow.safeBottom
#define StatusBarHeight UIWindow.safeStatusBarHeight
#define StatusBarSafeInsetHeight UIWindow.safeTop
#define DeviceiPhoneX UIWindow.hasSafaArea

#define Inch5_5 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 736)
#define Inch4_7 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 667)
#define Inch4 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)
#define Inch3_5 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 480)

//#define DeviceID    ([OpenUDID value] ? [OpenUDID value] : @"")
#define DeviceSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define IDFA    [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]

//*************************************************************************//
//*************************************************************************//
#pragma mark - Sandbox directory

#define HomePath NSHomeDirectory()
#define CachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define DocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define LibraryPath [NSHomeDirectory() stringByAppendingPathComponent:@"Library"]
#define TempPath NSTemporaryDirectory()

#define MainBoundPath [[NSBundle mainBundle] bundlePath]
#define ResourcePath [[NSBundle mainBundle] resourcePath]
#define ExecutablePath [[NSBundle mainBundle] executablePath]

//*************************************************************************//
//*************************************************************************//
#pragma mark - Info plist

#define BundleBuild ([[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey])
#define BundleName  ([[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey])
#define BundleID ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"])
#define BundleVersion ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])

//*************************************************************************//
//*************************************************************************//
#pragma mark - Log

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#endif
