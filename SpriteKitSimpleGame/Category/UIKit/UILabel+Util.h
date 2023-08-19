//
//  UILabel+Util.h
//  HJShop
//
//  Created by Red-Fish on 2019/12/9.
//  Copyright © 2019 HJShop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Util)

+ (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor;

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

@end

