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

/*
 *  判断字符串是否为空
 *  string - 字符串
 */
+ (BOOL) isStringEmpty:(NSString*)string {
    return (string == nil || [string isEqualToString:@""]);
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

@end
