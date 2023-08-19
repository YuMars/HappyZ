//
//  UIButton+Util.m
//  5GST
//
//  Created by Red-Fish on 2020/4/14.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import "UIButton+Util.h"

@implementation UIButton (Util)

+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    return [self buttonWithTitle:title color:color font:font backgroungNMImage:nil backgroungHLImage:nil cornerRadius:0.0];
}

+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font normalImage:(UIImage *)normalImage {
    return [self buttonWithTitle:title color:color font:font backgroungNMImage:normalImage backgroungHLImage:nil cornerRadius:0.0];
}

+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font normalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage {
    return [self buttonWithTitle:title color:color font:font backgroungNMImage:nil backgroungHLImage:nil cornerRadius:0.0];
}

+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font cornerRadius:(CGFloat)radius{
    return [self buttonWithTitle:title color:color font:font backgroungNMImage:nil backgroungHLImage:nil cornerRadius:radius];
}

+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font normalImage:(UIImage *)normalImage cornerRadius:(CGFloat)radius {
    return [self buttonWithTitle:title color:color font:font backgroungNMImage:normalImage backgroungHLImage:nil cornerRadius:radius];
}

+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font normalImageWithBlackMask:(UIImage *)normalImage  cornerRadius:(CGFloat)radius{
    return [self buttonWithTitle:title color:color font:font backgroungNMImage:normalImage backgroungHLImage:nil cornerRadius:radius];
}

+ (UIButton *)buttonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font backgroungNMImage:(UIImage *)normalImage backgroungHLImage:(UIImage *)highlightImage cornerRadius:(CGFloat)radius {
    UIButton *btn = [[UIButton alloc] init];
    if (title) { [btn setTitle:title forState:UIControlStateNormal]; }
    if (font) { btn.titleLabel.font = font; }
    if (color) { [btn setTitleColor:color forState:UIControlStateNormal]; }
    if (normalImage) { [btn setBackgroundImage:normalImage forState:UIControlStateNormal]; }
    if (highlightImage) { [btn setBackgroundImage:highlightImage forState:UIControlStateHighlighted]; }
    if (radius > 0) { btn.layer.cornerRadius = radius; btn.layer.masksToBounds = YES;}
    return btn;
}

+ (UIButton *)gradientButtonWithSuperView:(UIView *)superView
                                   frame:(CGRect)frame
                                   title:(NSString *)title
                              titleColor:(UIColor *)titleColor
                                    font:(UIFont *)font
                               leftColor:(UIColor *)leftColor
                              rightColor:(UIColor *)rightColor
                            cornerRadius:(CGFloat)cornerRadius{
    
    assert(leftColor);
    assert(rightColor);
    
    return [self gradientButtonWithSuperView:superView frame:frame title:title titleColor:titleColor font:font gradientColors:@[leftColor, rightColor] percentage:@[@0, @1] gradientType:(GradientFromLeftToRight) cornerRadius:cornerRadius];
    
}

+ (UIButton *)gradientButtonWithSuperView:(UIView *)superView
                                   frame:(CGRect)frame
                                   title:(NSString *)title
                              titleColor:(UIColor *)titleColor
                                    font:(UIFont *)font
                          gradientColors:(NSArray *)gradientColors
                              percentage:(NSArray *)percentage
                            gradientType:(GradientType)gradientType
                            cornerRadius:(CGFloat)cornerRadius{
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [button setTitleColor:titleColor forState:(UIControlStateNormal)];
    [button setTitle:title forState:(UIControlStateNormal)];
    button.titleLabel.font = font;
    button.frame = frame;
    
    if (gradientColors.count > 0) {
        
        UIImage *bgImage = [UIImage createImageWithSize:frame.size gradientColors:gradientColors percentage:percentage gradientType:gradientType];
        
        if (cornerRadius > 0) {
            
            bgImage = [bgImage roundedCornerImageWithCornerRadius:cornerRadius];
        }
        
        [button setBackgroundImage:bgImage forState:(UIControlStateNormal)];
    }
    
    [superView addSubview:button];
    
    return button;
}

@end
