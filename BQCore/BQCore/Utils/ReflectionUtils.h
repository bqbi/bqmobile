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
 *  通过对象获得类名
 *
 */
+ (NSString*)className:(id)obj;

@end
