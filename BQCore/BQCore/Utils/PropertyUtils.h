//
//  PropertyUtils.h
//  BQCore
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyUtils : NSObject

/*
 *  获得属性对象
 *  path - 路径，主键
 */
+ (NSMutableDictionary*) prop: (NSString*)path;

/*
 *  通过key和属性文件路径获得属性值
 *  key - 关键字
 *  path - 属性文件路径
 */
+ (NSString*) objectForKey: (NSString*)key withPath: (NSString*)path;

/*
 *  设置属性值
 *  var - 属性值
 *  key - 关键字
 *  path - 属性文件路径
 */
+ (void) setObject: (NSString*)var forKey:(NSString*)key forPath:(NSString*)path;

/*
 *  加载属性文件，并获得属性对象
 *  path - 文件路径
 */
+ (NSMutableDictionary*) loadAndGetProperties:(NSString*)path;

@end
