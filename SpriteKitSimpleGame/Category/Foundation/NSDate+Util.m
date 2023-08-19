//
//  NSDate+Util.m
//  QKiOS
//
//  Created by syxiaqj on 15/6/9.
//  Copyright (c) 2015年 qingka. All rights reserved.
//

#import "NSDate+Util.h"

@implementation NSDate (Util)

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
                  second:(NSUInteger)second
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    dateComponents.year = year;
    dateComponents.month = month;
    dateComponents.day = day;
    dateComponents.hour = hour;
    dateComponents.minute = minute;
    dateComponents.second = second;
    
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

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
                     day:(NSUInteger)day {
    return [NSDate dateWithYear:year month:month day:day hour:0 minute:0 second:0];
}


/****************************************************
 *@Description:实现dateFormatter单例方法
 *@Params:nil
 *Return:相应格式的NSDataFormatter对象
 ****************************************************/

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYMMddHHmmA
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmmss;
    if (!staticDateFormatterWithFormatYYYYMMddHHmmss) {
        staticDateFormatterWithFormatYYYYMMddHHmmss = [[NSDateFormatter alloc] init];
        staticDateFormatterWithFormatYYYYMMddHHmmss.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        [staticDateFormatterWithFormatYYYYMMddHHmmss setDateFormat:@"yy/MM/dd \nHH:mm a"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmmss;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmm
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmmss;
    if (!staticDateFormatterWithFormatYYYYMMddHHmmss) {
        staticDateFormatterWithFormatYYYYMMddHHmmss = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMddHHmmss setDateFormat:@"yyyy-MM-dd \nHH:mm"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmmss;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddDefault {
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMdd;
    if (!staticDateFormatterWithFormatYYYYMMdd) {
        staticDateFormatterWithFormatYYYYMMdd = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMdd setDateFormat:@"yyyy-MM-dd"];
    }
    
    return staticDateFormatterWithFormatYYYYMMdd;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMDefault {
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMM;
    if (!staticDateFormatterWithFormatYYYYMM) {
        staticDateFormatterWithFormatYYYYMM = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMM setDateFormat:@"yyyy-MM"];
    }
    
    return staticDateFormatterWithFormatYYYYMM;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddPoint
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMdd;
    if (!staticDateFormatterWithFormatYYYYMMdd) {
        staticDateFormatterWithFormatYYYYMMdd = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMdd setDateFormat:@"yyyy.MM.dd"];
    }
    
    return staticDateFormatterWithFormatYYYYMMdd;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMPoint {
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMdd;
    if (!staticDateFormatterWithFormatYYYYMMdd) {
        staticDateFormatterWithFormatYYYYMMdd = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMdd setDateFormat:@"yyyy.MM"];
    }
    
    return staticDateFormatterWithFormatYYYYMMdd;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddSlash {
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMdd;
    if (!staticDateFormatterWithFormatYYYYMMdd) {
        staticDateFormatterWithFormatYYYYMMdd = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMdd setDateFormat:@"yyyy/MM/dd"];
    }
    
    return staticDateFormatterWithFormatYYYYMMdd;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmSlash {
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmm;
    if (!staticDateFormatterWithFormatYYYYMMddHHmm) {
        staticDateFormatterWithFormatYYYYMMddHHmm = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMddHHmm setDateFormat:@"yyyy/MM/dd HH:mm"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmm;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmSep{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmm;
    if (!staticDateFormatterWithFormatYYYYMMddHHmm) {
        staticDateFormatterWithFormatYYYYMMddHHmm = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMddHHmm setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmm;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatMMddHHmm
{
    static NSDateFormatter *staticDateFormatterWithFormatMMddHHmm;
    if (!staticDateFormatterWithFormatMMddHHmm) {
        staticDateFormatterWithFormatMMddHHmm = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatMMddHHmm setDateFormat:@"MM-dd HH:mm"];
    }
    
    return staticDateFormatterWithFormatMMddHHmm;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatHHmm
{
    static NSDateFormatter *staticDateFormatterWithFormatHHmm;
    if (!staticDateFormatterWithFormatHHmm) {
        staticDateFormatterWithFormatHHmm = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatHHmm setDateFormat:@"HH:mm"];
    }
    
    return staticDateFormatterWithFormatHHmm;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddInChinese {
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddInChinese;
    if (!staticDateFormatterWithFormatYYYYMMddInChinese) {
        staticDateFormatterWithFormatYYYYMMddInChinese = [[NSDateFormatter alloc] init];
        staticDateFormatterWithFormatYYYYMMddInChinese.dateFormat = @"yyyy年MM月dd日";
    }
    return staticDateFormatterWithFormatYYYYMMddInChinese;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMInChinese {
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddInChinese;
    if (!staticDateFormatterWithFormatYYYYMMddInChinese) {
        staticDateFormatterWithFormatYYYYMMddInChinese = [[NSDateFormatter alloc] init];
        staticDateFormatterWithFormatYYYYMMddInChinese.dateFormat = @"yyyy年MM月";
    }
    return staticDateFormatterWithFormatYYYYMMddInChinese;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmInChinese
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmmssInChines;
    if (!staticDateFormatterWithFormatYYYYMMddHHmmssInChines) {
        staticDateFormatterWithFormatYYYYMMddHHmmssInChines = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMddHHmmssInChines setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmmssInChines;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatMMddHHmmInChinese
{
    static NSDateFormatter *staticDateFormatterWithFormatMMddHHmmInChinese;
    if (!staticDateFormatterWithFormatMMddHHmmInChinese) {
        staticDateFormatterWithFormatMMddHHmmInChinese = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatMMddHHmmInChinese setDateFormat:@"MM月dd日 HH:mm"];
    }
    
    return staticDateFormatterWithFormatMMddHHmmInChinese;
}


/**********************************************************
 *@Description:获取当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 *@Params:nil
 *@Return:当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 ***********************************************************/
- (NSDateComponents *)componentsOfDay
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
}


//  --------------------------NSDate---------------------------
/****************************************************
 *@Description:获得NSDate对应的年份
 *@Params:nil
 *@Return:NSDate对应的年份
 ****************************************************/
- (NSUInteger)year
{
    return [self componentsOfDay].year;
}

/****************************************************
 *@Description:获得NSDate对应的月份
 *@Params:nil
 *@Return:NSDate对应的月份
 ****************************************************/
- (NSUInteger)month
{
    return [self componentsOfDay].month;
}


/****************************************************
 *@Description:获得NSDate对应的日期
 *@Params:nil
 *@Return:NSDate对应的日期
 ****************************************************/
- (NSUInteger)day
{
    return [self componentsOfDay].day;
}


/****************************************************
 *@Description:获得NSDate对应的小时数
 *@Params:nil
 *@Return:NSDate对应的小时数
 ****************************************************/
- (NSUInteger)hour
{
    return [self componentsOfDay].hour;
}


/****************************************************
 *@Description:获得NSDate对应的分钟数
 *@Params:nil
 *@Return:NSDate对应的分钟数
 ****************************************************/
- (NSUInteger)minute
{
    return [self componentsOfDay].minute;
}


/****************************************************
 *@Description:获得NSDate对应的秒数
 *@Params:nil
 *@Return:NSDate对应的秒数
 ****************************************************/
- (NSUInteger)second
{
    return [self componentsOfDay].second;
}

/****************************************************
 *@Description:获得NSDate对应的星期
 *@Params:nil
 *@Return:NSDate对应的星期
 ****************************************************/
- (NSUInteger)weekday
{
    return [self componentsOfDay].weekday;
}

/******************************************
 *@Description:获取当天是当年的第几周
 *@Params:nil
 *@Return:当天是当年的第几周
 ******************************************/
- (NSUInteger)weekOfDayInYear
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitYear forDate:self];
}


/****************************************************
 *@Description:获得一般当天的工作开始时间
 *@Params:nil
 *@Return:一般当天的工作开始时间
 ****************************************************/
- (NSDate *)workBeginTime
{
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:self];
    [components setHour:9];
    [components setMinute:30];
    [components setSecond:0];
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

/****************************************************
 *@Description:获得一般当天的工作结束时间
 *@Params:nil
 *@Return:一般当天的工作结束时间
 ****************************************************/
- (NSDate *)workEndTime
{
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:self];
    [components setHour:18];
    [components setMinute:0];
    [components setSecond:0];
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}


/****************************************************
 *@Description:获取一小时后的时间
 *@Params:nil
 *@Return:一小时后的时间
 ****************************************************/
- (NSDate *)oneHourLater
{
    return [NSDate dateWithTimeInterval:3600 sinceDate:self];
}


/****************************************************
 *@Description:获得某一天的这个时刻
 *@Params:nil
 *@Return:某一天的这个时刻
 ****************************************************/
- (NSDate *)sameTimeOfDate
{
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:self];
    [components setHour:[[NSDate date] hour]];
    [components setMinute:[[NSDate date] minute]];
    [components setSecond:[[NSDate date] second]];
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

/******************************************
 *@Description:判断与某一天是否为同一天
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一天；NO-不同一天
 ******************************************/
- (BOOL)sameDayWithDate:(NSDate *)otherDate
{
    if (self.year == otherDate.year && self.month == otherDate.month && self.day == otherDate.day) {
        return YES;
    } else {
        return NO;
    }
}


/******************************************
 *@Description:判断与某一天是否为同一周
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一周；NO-不同一周
 ******************************************/
- (BOOL)sameWeekWithDate:(NSDate *)otherDate
{
    if (self.year == otherDate.year  && self.month == otherDate.month && self.weekOfDayInYear == otherDate.weekOfDayInYear) {
        return YES;
    } else {
        return NO;
    }
}

/******************************************
 *@Description:判断与某一天是否为同一月
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一月；NO-不同一月
 ******************************************/
- (BOOL)sameMonthWithDate:(NSDate *)otherDate
{
    if (self.year == otherDate.year && self.month == otherDate.month) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)sameYearWithDate:(NSDate *)otherDate
{
    if (self.year == otherDate.year)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


/****************************************************
 *@Description:获取时间的字符串格式
 *@Params:nil
 *@Return:时间的字符串格式
 ****************************************************/
- (NSString *)stringOfDateWithFormatYYMMddHHmmA {
    return [[NSDate defaultDateFormatterWithFormatYYMMddHHmmA] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddHHmm
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddHHmm] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddDefault
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddDefault] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMDefault
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMMDefault] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddPoint {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddPoint] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMPoint {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMPoint] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddSlash {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddSlash] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddHHmmSlash {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddHHmmSlash] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddHHmmSep {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddHHmmSep] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatMMddHHmm
{
    return [[NSDate defaultDateFormatterWithFormatMMddHHmm] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatHHmm
{
    return [[NSDate defaultDateFormatterWithFormatHHmm] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddInChinese {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddInChinese] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMInChinese {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMInChinese] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddHHmmInChinese
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddHHmmInChinese] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatMMddHHmmInChinese
{
    return [[NSDate defaultDateFormatterWithFormatMMddHHmmInChinese] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatInAllChinese {
    int year = (int)self.year;
    int month = (int)self.month;
    int day = (int)self.day;
    
    NSArray *numCNList = @[@"〇", @"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九"];
    
    //转化年份
    NSString *yearNumString = [NSString stringWithFormat:@"%d", year];  //数字转化成文字
    NSMutableString *yearCNString = [NSMutableString string];   //转化后的对象
    for (int i = 0; i < yearNumString.length; i++) {
        NSString *let = [yearNumString substringWithRange:NSMakeRange(i, 1)];
        NSString *letCN = [numCNList objectAtIndex:let.intValue];
        [yearCNString appendString:letCN];
    }
    
    //转化月份
    NSString *monthNumString = [NSString stringWithFormat:@"%d", month];
    NSMutableString *monthCNString = [NSMutableString string];
    for (int i = 0; i < monthNumString.length; i++) {
        NSString *let = [monthNumString substringWithRange:NSMakeRange(i, 1)];
        NSString *letCN = [numCNList objectAtIndex:let.intValue];
        [monthCNString appendString:letCN];
    }
    
    //转化日
    NSString *dayNumString = [NSString stringWithFormat:@"%d", day];
    NSMutableString *dayCNString = [NSMutableString string];
    for (int i = 0; i < dayNumString.length; i++) {
        NSString *let = [dayNumString substringWithRange:NSMakeRange(i, 1)];
        NSString *letCN = [numCNList objectAtIndex:let.intValue];
        [dayCNString appendString:letCN];
    }
    
    return [NSString stringWithFormat:@"%@年%@月%@日", yearCNString, monthCNString, dayCNString];
}

+ (NSNumber *)getNowTimestamp {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];   //----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    //现在时间
    NSDate *datenow = [NSDate date];
    //时间转时间戳的方法:
    NSNumber *timeSp = [NSNumber numberWithLong:(long)[datenow timeIntervalSince1970] * 1000];
    return timeSp;
}

+ (NSNumber *)localTimestamp {
    return @([[NSDate date] timeIntervalSince1970] * 1000);
}

+ (NSDate *)dateWithTimestamp:(NSNumber *)tms {
    return [NSDate dateWithTimeIntervalSince1970:([tms longLongValue] / 1000)];
}

+ (NSDate *)dateWithStringYYYYMMddDefault:(NSString *)dateString {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddDefault] dateFromString:dateString];
}

+ (NSDate *)dateWithStringYYYYMMDefault:(NSString *)dateString {
    return [[NSDate defaultDateFormatterWithFormatYYYYMMDefault] dateFromString:dateString];
}

- (NSNumber *)timestamp {
    return @([self timeIntervalSince1970] * 1000);
}

- (BOOL)isYesterday {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 获得只有年月日的时间
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSString *selfString = [fmt stringFromDate:self];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    // 比较
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

- (BOOL)isToday {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year && nowCmps.month == selfCmps.month && nowCmps.day == selfCmps.day;
}

- (BOOL)isTomorrow {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 获得只有年月日的时间
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSString *selfString = [fmt stringFromDate:self];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    // 比较
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == -1;
}

@end
