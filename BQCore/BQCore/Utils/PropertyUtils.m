//
//  PropertyUtils.m
//  BQCore
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "PropertyUtils.h"

#import "Common.h"
#import "FSUtils.h"

@implementation PropertyUtils

static NSMutableDictionary* _props = nil;

+ (NSMutableDictionary*) props {
    if (_props == nil) {
        @synchronized([PropertyUtils class]) {
            _props = [NSMutableDictionary dictionaryWithCapacity:10];
        }
    }
    return _props;
}

/*
 *  获得属性对象
 *  path - 路径，主键
 */
+ (NSMutableDictionary*) prop: (NSString*)path {
    return [[self props] objectForKey:path];
}

/*
 *  通过key和属性文件路径获得属性值
 *  key - 关键字
 *  path - 属性文件路径
 */
+ (NSString*) objectForKey: (NSString*)key withPath: (NSString*)path {
    NSMutableDictionary* dic = [self loadAndGetProperties:path];
    if (dic) {
        return [dic objectForKey:key];
    }
    return nil;
}

/*
 *  设置属性值
 *  var - 属性值
 *  key - 关键字
 *  path - 属性文件路径
 */
+ (void) setObject: (NSString*)var forKey:(NSString*)key forPath:(NSString*)path {
    NSMutableDictionary* dic = [self loadAndGetProperties:path];
    [dic setObject:var forKey:key];
}

/*
 *  加载属性文件，并获得属性对象
 *  path - 文件路径
 */
+ (NSMutableDictionary*) loadAndGetProperties:(NSString*)path {
    NSMutableDictionary* props = [self props];
    // 如果已经加载过，则不再加载
    if ([props objectForKey:path]) {
        return [props objectForKey:path];
    }
    
    NSString* temp;
    NSString* key;
    NSString* val;
    NSRange tempRange;
    NSMutableDictionary* propDic = [NSMutableDictionary dictionaryWithCapacity:10];
    
    // 按行读取文件
    NSString* str = [FSUtils readFile:path];
    NSArray* lines = [str componentsSeparatedByString:@"\n"];
    NSEnumerator* nse = [lines objectEnumerator];
    while (temp=[nse nextObject]) {
        temp = [Common trimString:temp];
        // 空行，跳过
        if ([Common isStringEmpty:temp]) {
            continue;
        }
        // #为注释标记，跳过
        if ([temp characterAtIndex:0] == '#') {
            continue;
        }
        // 不包含=，跳过
        tempRange = [temp rangeOfString:@"="];
        if (tempRange.location == NSNotFound) {
            continue;
        }
        key = [Common trimString:[temp substringToIndex:tempRange.location]];
        val = [Common trimString:[temp substringFromIndex:tempRange.location+1]];
        [propDic setObject:val forKey:key];
    }
    
    [props setObject:propDic forKey:path];
    return propDic;
}

@end
