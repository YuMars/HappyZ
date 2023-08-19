//
//  UIColor+Util.m
//  5GST
//
//  Created by Red-Fish on 2020/4/13.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import "UIColor+Util.h"

#import "NSString+Util.h"

@implementation UIColor (Util)

- (UIColor *(^)(CGFloat))alpha {
    //    UIColor *(^aplhaColorBlock)(CGFloat) = ^(CGFloat changeAplha) {
    //        CGFloat red = 0.0;
    //        CGFloat green = 0.0;
    //        CGFloat blue = 0.0;
    //        CGFloat alpha = 0.0;
    //        [self getRed:&red green:&green blue:&blue alpha:&alpha];
    //        UIColor *aplhaColor = [UIColor colorWithRed:red green:green blue:blue alpha:changeAplha];
    //        return aplhaColor;
    //    };
    //    return aplhaColorBlock;
    
    // Block的两种写法
    
    return ^(CGFloat changeAlpha) {
        CGFloat red = 0.0;
        CGFloat green = 0.0;
        CGFloat blue = 0.0;
        CGFloat alpha = 0.0;
        [self getRed:&red green:&green blue:&blue alpha:&alpha];
        alpha = alpha;
        return [UIColor colorWithRed:red green:green blue:blue alpha:changeAlpha];
    };
}

- (void)setAlpha:(UIColor *(^)(CGFloat))alpha {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"必须在子类中重写%@方法", NSStringFromSelector(_cmd)] userInfo:nil];
}

+ (UIColor *)colorFromHexAlphaString:(NSString *)hexString {
    
    if ([hexString trimmingSartEndWhitespace].length != 8) { return [UIColor blackColor]; }
    
    hexString = [hexString uppercaseString];
    
    NSString *alphaStr = [hexString substringToIndex:2];
    NSString *colorStr = [hexString substringFromIndex:2];
    
    NSInteger alphaValue = [self valueFromHexString:alphaStr];
    NSInteger colorValue = [self valueFromHexString:colorStr];
    
    return COLOR_WITH_HEX_A(colorValue, alphaValue);
}

#pragma mark - Pri

+ (NSInteger)valueFromHexString:(NSString *)string {
    
    const char *hexChar = [string cStringUsingEncoding:NSUTF8StringEncoding];
    
    int hexNumber;
    
    sscanf(hexChar, "%x", &hexNumber);
    
    return (NSInteger)hexNumber;
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color {
    return [self colorWithHexString:color alpha:1.0f];
}

+ (UIColor *)colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(red)/255.0 green:(green)/255.0 blue:(blue)/255.0 alpha:(alpha)];
}

// 默认alpha位1
+ (UIColor *)colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [self colorByMultiplyingByRed:red green:green blue:blue alpha:1];
}

@end
