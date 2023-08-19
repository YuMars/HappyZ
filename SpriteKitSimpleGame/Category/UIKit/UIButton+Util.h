//
//  UIButton+Util.h
//  5GST
//
//  Created by Red-Fish on 2020/4/14.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Util.h"

@interface UIButton (Util)

/// title,color,font
+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;

/// title,color,font,normalImage
+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font normalImage:(UIImage *)normalImage;

/// title,color,font,normalImage,highlightImage
+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font normalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;

/// title,color,font,radius
+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font cornerRadius:(CGFloat)radius;

/// title,color,font,normalImage,radius
+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font normalImage:(UIImage *)normalImage cornerRadius:(CGFloat)radius;

+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font normalImageWithBlackMask:(UIImage *)normalImage  cornerRadius:(CGFloat)radius;

/// title,color,font,normalImage,highlightImage,radius
+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font backgroungNMImage:(UIImage *)normalImage backgroungHLImage:(UIImage *)highlightImage cornerRadius:(CGFloat)radius;

/** 创建左右渐变色可带圆角的按钮，frame.size一定要有值 */
+ (UIButton *)gradientButtonWithSuperView:(UIView *)superView
                                   frame:(CGRect)frame
                                   title:(NSString *)title
                              titleColor:(UIColor *)titleColor
                                    font:(UIFont *)font
                               leftColor:(UIColor *)leftColor
                              rightColor:(UIColor *)rightColor
                            cornerRadius:(CGFloat)cornerRadius;

/** 创建渐变色可带圆角的按钮，frame.size一定要有值 */
+ (UIButton *)gradientButtonWithSuperView:(UIView *)superView
                                   frame:(CGRect)frame
                                   title:(NSString *)title
                              titleColor:(UIColor *)titleColor
                                    font:(UIFont *)font
                          gradientColors:(NSArray *)gradientColors
                              percentage:(NSArray *)percentage
                            gradientType:(GradientType)gradientType
                            cornerRadius:(CGFloat)cornerRadius;

@end

