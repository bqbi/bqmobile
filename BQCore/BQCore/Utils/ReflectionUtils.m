//
//  ReflectionUtils.m
//  BQCore
//
//  Created by 潘 巍 on 14-4-16.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "ReflectionUtils.h"

#import <objc/runtime.h>
#import "Common.h"

@implementation ReflectionUtils

/*
 *  获得类的属性列表
 *
 */
+ (NSArray*)getPropertyList:(Class)clazz {
    u_int count;
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        const char* propertyName = property_getName(properties[i]);
        [propertyArray addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(properties);
    return propertyArray;
}

/*
 *  通过一个对象和属性名称，获得属性值
 *
 */
+ (id)getProperty:(id)obj withFieldName:(NSString*)fieldName {
    SEL selector = NSSelectorFromString(fieldName);
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id value = [obj performSelector:selector];
    #pragma clang diagnostic pop
    
    if (value == nil) {
        value = [NSNull null];
    }
    return value;
}

/*
 *  将一个实体对象，转换成字典
 *
 */
+ (NSDictionary*)convertDictionary:(id)obj {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    NSArray* propertyList = [self getPropertyList:[obj class]];
    for (NSString* key in propertyList) {
        [dict setObject:[self getProperty:obj withFieldName:key] forKey:key];
    }
    
    return dict;
}

/*
 *  通过对象获得类名
 *
 */
+ (NSString*)className:(id)obj {
    return [NSString stringWithUTF8String:object_getClassName(obj)];
}

/*
 *  通过类名获得类对象
 *
 */
+ (Class)getClass:(NSString*)className {
    if (![Common isStringEmpty:className]) {
        return NSClassFromString(className);
    }
    return [NSNull class];
}

/*
 *  通过类名实例化一个对象
 *
 */
+ (id)allocWithClassName:(NSString*)className {
    Class clazz = [self getClass:className];
    return [clazz alloc];
}

@end
