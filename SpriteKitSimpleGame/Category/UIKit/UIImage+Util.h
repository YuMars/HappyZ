//
//  UIImage+Util.h
//  HJShop
//
//  Created by Red-Fish on 2019/12/4.
//  Copyright © 2019 HJShop. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GradientType) {
    GradientFromTopToBottom = 1,            //从上到下
    GradientFromLeftToRight,                //从左到右
    GradientFromLeftTopToRightBottom,       //从上到下
    GradientFromLeftBottomToRightTop        //从下到上
};

@interface UIImage (Util)

+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (instancetype)imageWithColor:(UIColor *)color;

+ (instancetype)stretchableImageWithColor:(UIColor *)color;

- (UIImage *)addImage:(UIImage *)image;

- (UIImage *)roundedCornerImageWithCornerRadius:(CGFloat)cornerRadius;

- (instancetype)scaleAspectFillToSize:(CGSize)size;

- (UIImage*)imageChangeColor:(UIColor*)color;

- (UIImage *)imageResizeTo:(CGSize)size;

/**
*  根据给定的颜色，生成渐变色的图片
*  @param imageSize        要生成的图片的大小
*  @param colorArr         渐变颜色的数组
*  @param percents          渐变颜色的占比数组
*  @param gradientType     渐变色的类型
*/

+ (UIImage *)createImageWithSize:(CGSize)imageSize gradientColors:(NSArray *)colorArr percentage:(NSArray *)percents gradientType:(GradientType)gradientType;

@end
