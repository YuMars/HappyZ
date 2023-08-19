//
//  UIColor+Util.h
//  5GST
//
//  Created by Red-Fish on 2020/4/13.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import <UIKit/UIKit.h>

#define COLOR_WITH_RGBA(r, g, b, a) [UIColor colorWithRed: (r) / 255.0f green: (g) / 255.0f blue: (b) / 255.0f alpha:(a)]

#define COLOR_WITH_RGB(r, g, b) COLOR_WITH_RGBA(r, g, b, 1.0)

#define COLOR_WITH_HEX_A(hexValue, a) ([UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:(a)])
#define COLOR_WITH_HEX(hex) COLOR_WITH_HEX_A(hex, 1.0)

#define COLOR_WITH_HEX_AHEX(hexValue) ([UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:(((float)((hexValue & 0xFF000000) >> 24))/255.0)])

@interface UIColor (Util)

/// 改变Color的alpha
@property (nonatomic, copy) UIColor *(^alpha)(CGFloat alpha);

/// 制字符串（16进）转化成UIColor 开头2位表示 透明度 后面6位表示颜色值
+ (UIColor *)colorFromHexAlphaString:(NSString *)hexString;

/// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)color;

/// 从十六进制字符串获取颜色， 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/// 从十六进制字符串获取颜色，支持0-255十进制,alpha支持0-1
+ (UIColor *)colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/// 默认alpha位1
+ (UIColor *)colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

@end

