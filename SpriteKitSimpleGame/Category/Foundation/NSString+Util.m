//
//  NSString+Util.m
//  HJShop
//
//  Created by Red-Fish on 2019/12/9.
//  Copyright © 2019 HJShop. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

// 字符串编码
- (NSString *)urlEncodeString {
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, CFSTR(":/?#[]@!$&’(){}<>*+,;="), NULL,kCFStringEncodingUTF8));
    return result;
}

- (NSString *)urlUnitString {
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, CFSTR("/?#[]@!$&’()<>*+;="), NULL,kCFStringEncodingUTF8));
       return result;
}

// 反URL编码
- (NSString *)decodeFromPercentEscapeString {
    NSMutableString *outputStr = [NSMutableString stringWithString:self];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)base64Encode {
    NSString *base64String = [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64String;
}

/// base64 NSString 解码
- (NSString *)base64Decode {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    NSString *base64String = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

- (NSString *)trimmingSartEndWhitespace {
    return [self stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)timeStringMmssWithSeconds:(NSTimeInterval)time {
    int value = floorf(time);
    
    int seconds = value % 60;
    int minutes = value / 60;
    
    return [NSString stringWithFormat:@"%02i:%02i", minutes, seconds];
}
@end
