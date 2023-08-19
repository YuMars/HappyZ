//
//  UILabel+Util.m
//  HJShop
//
//  Created by Red-Fish on 2019/12/9.
//  Copyright © 2019 HJShop. All rights reserved.
//

#import "UILabel+Util.h"

@implementation UILabel (Util)

+ (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor {
    return [self labelWithText:nil font:font textColor:textColor];
}

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *lbl = [[UILabel alloc] init];
    if(text) lbl.text = text;
    if(font) lbl.font = font;
    if(textColor) lbl.textColor = textColor;
    return lbl;
}

@end
