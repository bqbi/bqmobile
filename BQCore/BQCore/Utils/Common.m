//
//  Common.m
//  BQCore
//
//  Created by 潘 巍 on 14-2-17.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "Common.h"
#import "FSUtils.h"
#import "BQContext.h"
#import "PropertyUtils.h"
#import "BQServerAccess.h"

@implementation Common

//  判断设备是否是iPad
+ (BOOL) deviceIsIpad {
    UIDevice *device = [UIDevice currentDevice];
    NSString *str = device.model;
    if([str rangeOfString:@"iPad"].length > 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/*
 *  设置用户自定义参数
 *  var - 参数值
 *  name - 参数名
 */
+ (void) setCustomParameter:(NSString*)var forName:(NSString*)name {
    NSString* path = nil;
    // 1.是否已经登录，从登录服务器的本地目录下读取
    if ([[BQContext sharedContext] currentUser]) {
        path = [[[BQContext sharedContext] serverAccess] getCachePath:NO];
    }
    
    // 2.如果没有登录，获取默认路径下读取
    if (path == nil) {
        path = [FSUtils getDocPath];
    }
    NSString* configFile = [NSString stringWithFormat:@"%@/application.cfg", path];
    
    // 3.修改属性
    [PropertyUtils setObject:var forKey:name forPath:configFile];
    
    // 4.保持文件
    [FSUtils writePropertyFile:[PropertyUtils prop:configFile] forPath:configFile];
    
}

/*
 *  获得全局参数
 *  name - 参数名称
 */
+ (NSString*) getGlobalParameter:(NSString*) name {
    NSString* path = nil;
    
    // 1.是否已经登录，从登录服务器的本地目录下读取
    if ([[BQContext sharedContext] currentUser]) {
        path = [[[BQContext sharedContext] serverAccess] getCachePath:NO];
    }
    
    // 2.如果没有登录，获取默认路径下读取
    if (path == nil) {
        path = [FSUtils getDocPath];
    }
    NSString* configFile = [NSString stringWithFormat:@"%@/application.cfg", path];
    // 缓冲属性字典，并返回值
    NSString* result = [PropertyUtils objectForKey:name withPath:configFile];
    
    // 3.如果仍没有获得，从应用目录下读取
    if (result == nil) {
        configFile = [FSUtils getResourcePath:@"application.cfg"];
        result = [PropertyUtils objectForKey:name withPath:configFile];
    }
    
    return result;
}

//  获取全局风格
+ (NSString*) getGlobalStyle {
    NSString* style = nil;
    if ([Common isStringEmpty:style]) {
        style = [Common getGlobalParameter:PARAMETER_LAST_UI_STYLE];
    }
    if ([Common isStringEmpty:style]) {
        style = [Common getGlobalParameter:GLOBAL_UI_STYLE];
        
    }
    return style;
}

//  设置全局风格
+ (void) setGlobalStyle:(NSString*) style {
    if ([Common isStringEmpty:style]) {
        style = [Common getGlobalParameter:GLOBAL_UI_STYLE];
    }
    
    // 保持文件
    [self setCustomParameter:style forName:PARAMETER_LAST_UI_STYLE];
}

/*
 *  判断字符串是否为空
 *  string - 字符串
 */
+ (BOOL) isStringEmpty:(NSString*)string {
    return (string == nil || [string isEqualToString:@""]);
}

/*
 *  判断对象是否为空
 *  obj - 对象
 *
 */
+ (BOOL) isObjectNull:(id)obj {
    return obj == nil || [obj isKindOfClass:[NSNull class]];
}

/*
 *  判断是否一个字符被认为是空白
 *  本系统中认为空格、制表符、换行、回车都认为是空白
 *  c - 字符
 */
+ (BOOL) isSpace:(char)c {
    return c == ' ' || c == '\t' || c == '\r' || c == '\n';
}

/*
 *  去除字符串左部的空白
 *  string - 字符串
 *
 */
+ (NSString*) ltrim:(NSString*)string {
    if (string == nil) {
        return nil;
    }
    
    NSInteger max = [string length] - 1;
    NSInteger min = 0;
    
    while (min <= max && [self isSpace:[string characterAtIndex:min]]) {
        min++;
    }
    
    return [string substringWithRange:NSMakeRange(min, (max - min + 1))];
}

/*
 *  去除字符串右部的空白
 *  string - 字符串
 *
 */
+ (NSString*) rtrim:(NSString*)string {
    if (string == nil) {
        return nil;
    }
    
    NSInteger max = [string length] - 1;
    NSInteger min = 0;
    
    while (max >= 0 && [self isSpace:[string characterAtIndex:max]]) {
        max--;
    }
    
    return [string substringWithRange:NSMakeRange(min, (max - min + 1))];
}

/*
 *  去除字符串左右的空白
 *  string - 字符串
 *
 */
+ (NSString*) trim:(NSString*)string {
    if (string == nil) {
        return nil;
    }
    
    NSInteger max = [string length] - 1;
    NSInteger min = 0;
    
    while (min <= max && [self isSpace:[string characterAtIndex:min]]) {
        min++;
    }
    
    while (max >= 0 && [self isSpace:[string characterAtIndex:max]]) {
        max--;
    }
    
    return [string substringWithRange:NSMakeRange(min, (max - min + 1))];
}

/*
 *  去除空格
 *  string - 字符串
 */
+ (NSString*) trimString:(NSString*)string {
    if ([self isStringEmpty:string]) {
        return string;
    }
    if ([string characterAtIndex:0] != ' ' && [string characterAtIndex:[string length] - 1] != ' ') {
        return string;
    }
    
    NSMutableString* result  = [string mutableCopy];
    CFStringTrimWhitespace((CFMutableStringRef)result);
    return result;
}

/*
 *  是否以指定字符结尾
 *  string - 字符串
 *  prefix - 后缀字符串
 */
+ (BOOL) endWith:(NSString*)string prefix:(NSString*)prefix
{
    return [string hasSuffix:prefix];
}

/*
 *  是否以指定字符开头
 *  string - 字符串
 *  prefix - 前缀字符串
 */
+ (BOOL) beginWith:(NSString*)string prefix:(NSString*)prefix
{
//    NSString * ret = [Common subString:string start:0 stop:(int)([prefix length])];
    return[string hasPrefix:prefix];
//    return ![Common isObjectNull:ret] && ![Common isStringEmpty:ret];
}

/*
 *  查找字符位置
 *  string - 被查找的字符串
 *  start - 字符串开始位置
 *  stop - 字符串结束位置
 */
+ (NSString*) subString:(NSString*) string start:(int) start stop:(int) stop {
    if (string == nil || (stop >= 0 && stop < start)) {
        return nil;
    }
    if (stop == start) {
        return @"";
    }
    if (stop == -1) {
        return [string substringFromIndex:start];
    } else if (start == 0) {
        return [string substringFromIndex:stop];
    } else {
        NSRange range = {start, stop - start};
        return [string substringWithRange:range];
    }
}

/*
 *  查找字符位置
 *  string - 被查找的字符串
 *  findWhat - 要查找的字符
 *  startPos - 开始查找位置
 */
+ (int) findChar:(NSString*) string findWhat: (char) findWhat startPos: (int) startPos {
    if (string) {
        if (startPos < 0) {
            startPos = 0;
        }
        int i, len = [string length];
        for (i = startPos; i < len; i++) {
            if ([string characterAtIndex:i] == findWhat) {
                return i;
            }
        }
    }
    return -1;
}

/*
 *  查找字符串位置
 *  string - 被查找的字符串
 *  findWhat - 要查找的字符串
 *  startPos - 开始查找位置
 */
+ (int) findString:(NSString*) string findWhat: (NSString*) findWhat startPos: (int) startPos {
    
    if (string == nil || findWhat == nil) {
        return -1;
    } else if (startPos <= 0) {
        NSRange result = [string rangeOfString:findWhat];
        if (result.location != NSNotFound) {
            return result.location;
        }
    } else {
        NSRange range = {startPos, [string length] - startPos};
        NSRange result = [string rangeOfString:findWhat options:0 range:range];
        if (result.location != NSNotFound) {
            return result.location;
        }
    }
    
    return -1;
}



/*
 *  字符串NVL
 *  string
 *  def
 *
 */
+ (NSString*) NVL:(NSString*)string withDefault:(NSString*)def {
    if (![self isStringEmpty:string]) {
        return string;
    }
    return def;
}

/*
 *  忽略大小写比较
 *  str1
 *  str2
 *
 */
+ (BOOL) isEqualIgnoreCaseToString:(NSString*)str1 withSecondString:(NSString*)str2 {
    return [str1 caseInsensitiveCompare:str2] == NSOrderedSame;
}

/*
 *  字符串转布尔值
 *  string
 *  def
 *
 */
+ (BOOL) stringToBOOL:(NSString*)string {
    return [self stringToBOOL:string withDefault:NO];
}

+ (BOOL) stringToBOOL:(NSString*)string withDefault:(BOOL)def {
    if (![self isStringEmpty:string]) {
        if ([self isEqualIgnoreCaseToString:string withSecondString:@"true"] || [self isEqualIgnoreCaseToString:string withSecondString:@"yes"] || [self isEqualIgnoreCaseToString:string withSecondString:@"y"] || [self isEqualIgnoreCaseToString:string withSecondString:@"1"]) {
            return YES;
        }
        
        else if ([self isEqualIgnoreCaseToString:string withSecondString:@"false"] || [self isEqualIgnoreCaseToString:string withSecondString:@"no"] || [self isEqualIgnoreCaseToString:string withSecondString:@"n"] || [self isEqualIgnoreCaseToString:string withSecondString:@"0"]) {
            return NO;
        }
        
    }
    return def;
}

/*
 *  字符串转整型值
 *  string
 *  def
 *
 */
+ (int) stringToInt:(NSString*)string {
    return [self stringToInt:string withDefault:0];
}

+ (int) stringToInt:(NSString*)string withDefault:(int)def {
    string = [self trim:string];
    if (![self isStringEmpty:string]) {
        return [string intValue];
    }
    return def;
}

+ (float) stringToFloat:(NSString*)string {
    return [self stringToFloat:string withDefault:0];
}

+ (float) stringToFloat:(NSString *)string withDefault:(float)def {
    string = [self trim:string];
    if (![self isStringEmpty:string]) {
        return [string floatValue];
    }
    return def;
}

+ (double) stringToDouble:(NSString*)string {
    return [self stringToDouble:string withDefault:0];
}

+ (double) stringToDouble:(NSString *)string withDefault:(double)def {
    string = [self trim:string];
    if (![self isStringEmpty:string]) {
        return [string doubleValue];
    }
    return def;
}

+ (CGRect) stringToCGRect:(NSString*)string {
    return [self stringToCGRect:string withDefault:CGRectMake(0, 0, 0, 0)];
}

+ (CGRect) stringToCGRect:(NSString*)string withDefault:(CGRect)def {
    string = [self trim:string];
    NSArray* rectArr = [string componentsSeparatedByString:@","];
    
    if ([rectArr count]>=4) {
        return CGRectMake([Common stringToFloat:(NSString*)rectArr[0] withDefault:0], [Common stringToFloat:(NSString*)rectArr[1] withDefault:0], [Common stringToFloat:(NSString*)rectArr[2] withDefault:0], [Common stringToFloat:(NSString*)rectArr[3] withDefault:0]);
    }
    
    return def;
}

+ (CGPoint) stringToCGPoint:(NSString*)string {
    return [self stringToCGPoint:string withDefault:CGPointMake(0, 0)];
}

+ (CGPoint) stringToCGPoint:(NSString*)string withDefault:(CGPoint)def{
    string = [self trim:string];
    NSArray* rectArr = [string componentsSeparatedByString:@","];
    
    if ([rectArr count]>=2) {
        return CGPointMake([Common stringToFloat:(NSString*)rectArr[0] withDefault:0], [Common stringToFloat:(NSString*)rectArr[1] withDefault:0]);
    }
    
    return def;
}

// 基本类型的装包和拆包操作
+ (NSNumber*) wrapBOOL:(BOOL)val {
    return [NSNumber numberWithBool:val];
}

+ (BOOL) unwrapBOOL:(NSNumber*)val {
    return [val boolValue];
}

+ (NSNumber*) wrapInt:(int)val {
    return [NSNumber numberWithInt:val];
}

+ (int) unwrapInt:(NSNumber*)val {
    return [val floatValue];
}

+ (NSNumber*) wrapFloat:(float)val {
    return [NSNumber numberWithFloat:val];
}

+ (float) unwrapFloat:(NSNumber*)val {
    return [val floatValue];
}

+ (NSNumber*) wrapDouble:(double)val {
    return [NSNumber numberWithDouble:val];
}

+ (double) unwrapDouble:(NSNumber*)val {
    return [val doubleValue];
}

+ (NSValue*) wrapCGRect:(CGRect)val {
    return [NSValue valueWithCGRect:val];
}

+ (CGRect) unwrapCGRect:(NSValue*)val {
    return [val CGRectValue];
}

+ (NSValue*) wrapCGPoint:(CGPoint)val {
    return [NSValue valueWithCGPoint:val];
}

+ (CGPoint) unwrapCGPoint:(NSValue*)val{
    return [val CGPointValue];
}


@end
