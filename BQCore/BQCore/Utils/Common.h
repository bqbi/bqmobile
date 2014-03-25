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
 *  判断字符串是否为空
 *  string - 字符串
 */
+ (BOOL) isStringEmpty:(NSString*)string;

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




@end
