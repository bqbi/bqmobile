//
//  ReflectionUtils.h
//  BQCore
//
//  Created by 潘 巍 on 14-4-16.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReflectionUtils : NSObject

/*
 *  获得类的属性列表
 *
 */
+ (NSArray*)getPropertyList:(Class)clazz;

/*
 *  通过一个对象和属性名称，获得属性值
 *
 */
+ (id)getProperty:(id)obj withFieldName:(NSString*)fieldName;

/*
 *  将一个实体对象，转换成字典
 *
 */
+ (NSDictionary*)convertDictionary:(id)obj;

/*
 *  通过对象获得类名
 *
 */
+ (NSString*)className:(id)obj;

/*
 *  通过类名获得类对象
 *
 */
+ (Class)getClass:(NSString*)className;

/*
 *  通过类名实例化一个对象
 *
 */
+ (id)allocWithClassName:(NSString*)className;

@end
