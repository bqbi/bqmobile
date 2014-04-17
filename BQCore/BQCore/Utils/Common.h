//
//  Common.h
//  BQCore
//
//  Created by 潘 巍 on 14-2-17.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>





#define GLOBAL_UI_STYLE @"UIStyle"  // 全局属性：皮肤样式
#define GLOBAL_REQUEST_TIMEOUT 15   // 全局属性：请求超时时间

#define PARAMETER_LAST_UI_STYLE @"LastUIStyle"


// 自定义皮肤风格
#define ROOT_VIEW_STYLE_CUSTOM @"Custom"





@interface Common : NSObject

//  判断设备是否是iPad
+ (BOOL) deviceIsIpad;

/*
 *  设置用户自定义参数
 *  var - 参数值
 *  name - 参数名
 */
+ (void) setCustomParameter:(NSString*)var forName:(NSString*)name;

/*
 *  获得全局参数
 *  name - 参数名称
 */
+ (NSString*) getGlobalParameter:(NSString*) name;

/*  
 *  获取全局风格
 */
+ (NSString*) getGlobalStyle;

/*  
 *  设置全局风格
 *  style - 样式
 *
 */
+ (void) setGlobalStyle:(NSString*) style;

/*
 *  判断字符串是否为空
 *  string - 字符串
 */
+ (BOOL) isStringEmpty:(NSString*)string;

/*
 *  判断对象是否为空
 *  obj - 对象
 *
 */
+ (BOOL) isObjectNull:(id)obj;

/*
 *  判断是否一个字符被认为是空白
 *  本系统中认为空格、制表符、换行、回车都认为是空白
 *  c - 字符
 */
+ (BOOL) isSpace:(char)c;

/*
 *  去除字符串左部的空白
 *  string - 字符串
 *
 */
+ (NSString*) ltrim:(NSString*)string;

/*
 *  去除字符串右部的空白
 *  string - 字符串
 *
 */
+ (NSString*) rtrim:(NSString*)string;

/*
 *  去除字符串左右的空白
 *  string - 字符串
 *
 */
+ (NSString*) trim:(NSString*)string;

/*
 *  去除空格
 *  string - 字符串
 */
+ (NSString*) trimString:(NSString*)string;

/*
 *  查找字符位置
 *  string - 被查找的字符串
 *  start - 字符串开始位置
 *  stop - 字符串结束位置
 */
+ (NSString*) subString:(NSString*) string start:(int) start stop:(int) stop;

/*
 *  查找字符位置
 *  string - 被查找的字符串
 *  findWhat - 要查找的字符
 *  startPos - 开始查找位置
 */
+ (int) findChar:(NSString*) string findWhat: (char) findWhat startPos: (int) startPos;

/*
 *  查找字符串位置
 *  string - 被查找的字符串
 *  findWhat - 要查找的字符串
 *  startPos - 开始查找位置
 */
+ (int) findString:(NSString*) string findWhat: (NSString*) findWhat startPos: (int) startPos;

/*
 *  字符串NVL
 *  string
 *  def
 *
 */
+ (NSString*) NVL:(NSString*)string withDefault:(NSString*)def;

/*
 *  忽略大小写比较
 *  str1
 *  str2
 *
 */
+ (BOOL) isEqualIgnoreCaseToString:(NSString*)str1 withSecondString:(NSString*)str2;

/*
 *  字符串转布尔值
 *  string
 *  def
 *
 */
+ (BOOL) stringToBOOL:(NSString*)string;
+ (BOOL) stringToBOOL:(NSString*)string withDefault:(BOOL)def;

/*
 *  字符串转整型值
 *  string
 *  def
 *
 */
+ (int) stringToInt:(NSString*)string;
+ (int) stringToInt:(NSString*)string withDefault:(int)def;

+ (float) stringToFloat:(NSString*)string;
+ (float) stringToFloat:(NSString *)string withDefault:(float)def;

+ (double) stringToDouble:(NSString*)string;
+ (double) stringToDouble:(NSString *)string withDefault:(double)def;

+ (CGRect) stringToCGRect:(NSString*)string;
+ (CGRect) stringToCGRect:(NSString*)string withDefault:(CGRect)def;

+ (CGPoint) stringToCGPoint:(NSString*)string;
+ (CGPoint) stringToCGPoint:(NSString*)string withDefault:(CGPoint)def;

// 基本类型的装包和拆包操作
+ (NSNumber*) wrapBOOL:(BOOL)val;
+ (BOOL) unwrapBOOL:(NSNumber*)val;

+ (NSNumber*) wrapInt:(int)val;
+ (int) unwrapInt:(NSNumber*)val;

+ (NSNumber*) wrapFloat:(float)val;
+ (float) unwrapFloat:(NSNumber*)val;

+ (NSNumber*) wrapDouble:(double)val;
+ (double) unwrapDouble:(NSNumber*)val;

+ (NSValue*) wrapCGRect:(CGRect)val;
+ (CGRect) unwrapCGRect:(NSValue*)val;

+ (NSValue*) wrapCGPoint:(CGPoint)val;
+ (CGPoint) unwrapCGPoint:(NSValue*)val;

@end
