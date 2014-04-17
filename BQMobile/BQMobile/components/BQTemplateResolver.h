//
//  BQTemplateResolver.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-30.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GDataXMLNode;
@class BQComponent;

@interface BQTemplateResolver : NSObject

/*
 *  解析模板
 *  node - 模板根节点
 *  relPath - 相对路径
 *  context - 上下文
 *
 */
+ (BQComponent*)resolver:(GDataXMLNode*)node withRelativePath:(NSString*)relPath withContext:(NSMutableDictionary*)context;

// 获得字符串型表达式解析结果
+ (NSString*)getExpressionValue:(NSString*)string withContext:(NSDictionary*)context;

// 获得对象型表达式解析结果
+ (id)getExpressionObjectValue:(NSString*)string withContext:(NSDictionary*)context;

@end
