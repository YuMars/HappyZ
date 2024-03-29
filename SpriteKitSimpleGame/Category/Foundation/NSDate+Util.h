//
//  NSDate+Util.h
//  QKiOS
//
//  Created by syxiaqj on 15/6/9.
//  Copyright (c) 2015年 qingka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Util)

/****************************************************
 *@Description:根据年份、月份、日期、小时数、分钟数、秒数返回NSDate
 *@Params:
 *  year:年份
 *  month:月份
 *  day:日期
 *  hour:小时数
 *  minute:分钟数
 *  second:秒数
 *@Return:
 ****************************************************/
+ (NSDate *)dateWithYear:(NSUInteger)year
                   month:(NSUInteger)month
                     day:(NSUInteger)day
                    hour:(NSUInteger)hour
                  minute:(NSUInteger)minute
                  second:(NSUInteger)second;

/****************************************************
 *@Description:根据年份、月份、日期，返回NSDate
 *@Params:
 *  year:年份
 *  month:月份
 *  day:日期
 *@Return:
 ****************************************************/
+ (NSDate *)dateWithYear:(NSUInteger)year
                   month:(NSUInteger)month
                     day:(NSUInteger)day;

/****************************************************
 *@Description:实现dateFormatter单例方法
 *@Params:nil
 *Return:相应格式的NSDataFormatter对象
 ****************************************************/
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYMMddHHmmA;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmm;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddPoint;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMPoint;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddDefault;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddSlash;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmSlash;
+ (NSDateFormatter *)defaultDateFormatterWithFormatMMddHHmm;
+ (NSDateFormatter *)defaultDateFormatterWithFormatHHmm;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddInChinese;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMInChinese;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmInChinese;
+ (NSDateFormatter *)defaultDateFormatterWithFormatMMddHHmmInChinese;

/**********************************************************
 *@Description:获取当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 *@Params:nil
 *@Return:当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 ***********************************************************/
- (NSDateComponents *)componentsOfDay;


/****************************************************
 *@Description:获得NSDate对应的年份
 *@Params:nil
 *@Return:NSDate对应的年份
 ****************************************************/
- (NSUInteger)year;

/****************************************************
 *@Description:获得NSDate对应的月份
 *@Params:nil
 *@Return:NSDate对应的月份
 ****************************************************/
- (NSUInteger)month;


/****************************************************
 *@Description:获得NSDate对应的日期
 *@Params:nil
 *@Return:NSDate对应的日期
 ****************************************************/
- (NSUInteger)day;


/****************************************************
 *@Description:获得NSDate对应的小时数
 *@Params:nil
 *@Return:NSDate对应的小时数
 ****************************************************/
- (NSUInteger)hour;


/****************************************************
 *@Description:获得NSDate对应的分钟数
 *@Params:nil
 *@Return:NSDate对应的分钟数
 ****************************************************/
- (NSUInteger)minute;


/****************************************************
 *@Description:获得NSDate对应的秒数
 *@Params:nil
 *@Return:NSDate对应的秒数
 ****************************************************/
- (NSUInteger)second;

/****************************************************
 *@Description:获得NSDate对应的星期
 *@Params:nil
 *@Return:NSDate对应的星期
 ****************************************************/
- (NSUInteger)weekday;

/******************************************
 *@Description:获取当天是当年的第几周
 *@Params:nil
 *@Return:当天是当年的第几周
 ******************************************/
- (NSUInteger)weekOfDayInYear;

/****************************************************
 *@Description:获得一般当天的工作开始时间
 *@Params:nil
 *@Return:一般当天的工作开始时间
 ****************************************************/
- (NSDate *)workBeginTime;


/****************************************************
 *@Description:获得一般当天的工作结束时间
 *@Params:nil
 *@Return:一般当天的工作结束时间
 ****************************************************/
- (NSDate *)workEndTime;


/****************************************************
 *@Description:获取一小时后的时间
 *@Params:nil
 *@Return:一小时后的时间
 ****************************************************/
- (NSDate *)oneHourLater;


/****************************************************
 *@Description:获得某一天的这个时刻
 *@Params:nil
 *@Return:某一天的这个时刻
 ****************************************************/
- (NSDate *)sameTimeOfDate;

/******************************************
 *@Description:判断与某一天是否为同一天
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一天；NO-不同一天
 ******************************************/
- (BOOL)sameDayWithDate:(NSDate *)otherDate;

/******************************************
 *@Description:判断与某一天是否为同一周
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一周；NO-不同一周
 ******************************************/
- (BOOL)sameWeekWithDate:(NSDate *)otherDate;

/******************************************
 *@Description:判断与某一天是否为同一月
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一月；NO-不同一月
 ******************************************/
- (BOOL)sameMonthWithDate:(NSDate *)otherDate;

/******************************************
 *@Description:判断与某一天是否为同一年
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一年；NO-不同一年
 ******************************************/
- (BOOL)sameYearWithDate:(NSDate *)otherDate;


/****************************************************
 *@Description:获取时间的字符串格式
 *@Params:nil
 *@Return:时间的字符串格式
 ****************************************************/
- (NSString *)stringOfDateWithFormatYYMMddHHmmA;
- (NSString *)stringOfDateWithFormatYYYYMMddHHmm;
- (NSString *)stringOfDateWithFormatYYYYMMddDefault;    // xxxx-xx-xx
- (NSString *)stringOfDateWithFormatYYYYMMDefault;      // xxxx-xx
- (NSString *)stringOfDateWithFormatYYYYMMddPoint;      // xxxx.xx.xx
- (NSString *)stringOfDateWithFormatYYYYMMPoint;        // xxxx.xx
- (NSString *)stringOfDateWithFormatYYYYMMddSlash;      // xxxx/xx/xx
- (NSString *)stringOfDateWithFormatYYYYMMddHHmmSlash;  // yyyy/MM/dd HH:mm
- (NSString *)stringOfDateWithFormatYYYYMMddHHmmSep;    // yyyy-MM-dd HH:mm
- (NSString *)stringOfDateWithFormatMMddHHmm;
- (NSString *)stringOfDateWithFormatHHmm;
- (NSString *)stringOfDateWithFormatYYYYMMddInChinese;  // yyyy年MM月dd日
- (NSString *)stringOfDateWithFormatYYYYMMInChinese;    // yyyy年MM月
- (NSString *)stringOfDateWithFormatYYYYMMddHHmmInChinese;
- (NSString *)stringOfDateWithFormatMMddHHmmInChinese;
- (NSString *)stringOfDateWithFormatInAllChinese;       // 二〇一六年七月八日


/******************************************
 *@Description:获取当前时间戳
 *@Params: nil
 *@Return: long型时间戳 单位:毫秒
 ******************************************/
+ (NSNumber *)localTimestamp;

/******************************************
 *@Description:获取当前时间戳
 *@Params: 时间戳，long
 *@Return: NSDate
 ******************************************/
+ (NSDate *)dateWithTimestamp:(NSNumber *)tms;

+ (NSDate *)dateWithStringYYYYMMddDefault:(NSString *)dateString;

- (NSNumber *)timestamp;

+ (NSNumber *)getNowTimestamp;

///是否是昨天
- (BOOL)isYesterday;
///是否今天
- (BOOL)isToday;
///是否是明天
- (BOOL)isTomorrow;

@end
