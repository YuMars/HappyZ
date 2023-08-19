//
//  NSString+Util.h
//  HJShop
//
//  Created by Red-Fish on 2019/12/9.
//  Copyright © 2019 HJShop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

/// 字符串转码
- (NSString*)urlEncodeString;

/// 字符串转码，用于json转换
- (NSString *)urlUnitString;

/// 反URL编码
- (NSString *)decodeFromPercentEscapeString;

/// NSString base64 转 NSString
- (NSString *)base64Encode;

/// base64 NSString 解码
- (NSString *)base64Decode;

///删除头尾空格
- (NSString*)trimmingSartEndWhitespace;

/// 秒转文字 mm:ss
+ (NSString *)timeStringMmssWithSeconds:(NSTimeInterval)time;

@end

