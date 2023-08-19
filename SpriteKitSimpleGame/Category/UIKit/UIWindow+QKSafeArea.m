//
//  UIWindow+QKSafeArea.m
//  QKUtilityLib
//
//  Created by young on 2022/11/7.
//

#import "UIWindow+QKSafeArea.h"

@implementation UIWindow (QKSafeArea)
+ (BOOL)hasSafaArea {
    if (@available(iOS 11.0, *)) {
        return [self mainWindow].safeAreaInsets.top > 0;
    }
    return NO;
}

+ (CGFloat)safeTop {
    if (@available(iOS 11.0, *)) {
        return [self mainWindow].safeAreaInsets.top;
    } else {
        return 0;
    }
}

+ (CGFloat)safeBottom {
    if (@available(iOS 11.0, *)) {
        return [self mainWindow].safeAreaInsets.bottom;
    } else {
        return 0;
    }
}

+ (UIWindow *)mainWindow {
    __block UIWindow *mainWindow = nil;
    [UIApplication.sharedApplication.windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.frame.size.width == UIScreen.mainScreen.bounds.size.width && obj.frame.size.height == UIScreen.mainScreen.bounds.size.height) {
            mainWindow = obj;
            *stop = YES;
        }
    }];
    return  mainWindow;
}

+ (CGFloat)safeNavigationBarHeight {
    if ([self hasSafaArea]) {
        return [self safeTop] + 44;
    } else {
        return 64;
    }
}
+ (CGFloat)safeTabBarHeight {
    if ([self hasSafaArea]) {
        return [self safeBottom] + 49;
    } else {
        return 49;
    }
}

+ (CGFloat)safeStatusBarHeight {
    if ([self hasSafaArea]) {
        return [self safeTop];
    } else {
        return 20;
    }
}
@end
