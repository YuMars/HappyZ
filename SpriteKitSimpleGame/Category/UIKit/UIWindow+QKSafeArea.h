//
//  UIWindow+QKSafeArea.h
//  QKUtilityLib
//
//  Created by young on 2022/11/7.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (QKSafeArea)
+ (BOOL)hasSafaArea;
+ (CGFloat)safeTop;
+ (CGFloat)safeBottom;
+ (CGFloat)safeNavigationBarHeight;
+ (CGFloat)safeTabBarHeight;
+ (CGFloat)safeStatusBarHeight;
@end

NS_ASSUME_NONNULL_END
