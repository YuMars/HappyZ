//
//  NSString+Size.h
//  5GST
//
//  Created by Red-Fish on 2020/4/16.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Size)

/// 获取文字宽度
- (CGFloat)getWidthWithFont:(UIFont *)font height:(CGFloat)height;

/// 获取文本高度
- (CGFloat)getHeightWithFont:(UIFont *)font width:(CGFloat)width;

/// 获取富文本宽度
- (CGFloat)getWidthWithAttributes:(NSDictionary *)attrs height:(CGFloat)height;

/// 获取富文本高度
- (CGFloat)getHeightWithAttributes:(NSDictionary *)attrs width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
