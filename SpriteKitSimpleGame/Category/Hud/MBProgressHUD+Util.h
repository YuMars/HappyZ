//
//  MBProgressHUD+Util.h
//  5GST
//
//  Created by Red-Fish on 2020/4/16.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import "MBProgressHUD.h"

// 统一的显示时长

static const NSTimeInterval kHudShowTime = 1.5;

@interface MBProgressHUD (Util)

#pragma mark 在指定的view上显示hud
+ (void)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (MBProgressHUD *)showActivityMessage:(NSString*)message view:(UIView *)view;


#pragma mark 在window上显示hud
+ (void)showMessage:(NSString *)message;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (MBProgressHUD *)showActivityMessage:(NSString*)message;

#pragma mark 移除hud
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end

