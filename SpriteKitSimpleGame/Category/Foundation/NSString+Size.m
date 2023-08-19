//
//  NSString+Size.m
//  5GST
//
//  Created by Red-Fish on 2020/4/16.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)getSizeWithFont:(UIFont *)font size:(CGSize)size {
    CGSize strSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return CGSizeMake(ceilf(strSize.width), ceilf(strSize.height));
}

- (CGFloat)getWidthWithFont:(UIFont *)font height:(CGFloat)height {
    return [self getSizeWithFont:font size:CGSizeMake(MAXFLOAT, height)].width;
}

- (CGFloat)getHeightWithFont:(UIFont *)font width:(CGFloat)width {
    return [self getSizeWithFont:font size:CGSizeMake(width, MAXFLOAT)].height;
}

- (CGSize)getSizeWithAttributes:(NSDictionary *)attributes size:(CGSize)size {
    CGSize strSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;
    return CGSizeMake(ceilf(strSize.width), ceilf(strSize.height));
}

- (CGFloat)getWidthWithAttributes:(NSDictionary *)attrs height:(CGFloat)height {
    return [self getSizeWithAttributes:attrs size:CGSizeMake(MAXFLOAT, height)].width;
}

- (CGFloat)getHeightWithAttributes:(NSDictionary *)attrs width:(CGFloat)width {
    return [self getSizeWithAttributes:attrs size:CGSizeMake(width, MAXFLOAT)].height;
}

@end
