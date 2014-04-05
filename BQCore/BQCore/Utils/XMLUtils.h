//
//  XMLUtils.h
//  BQCore
//
//  Created by 潘 巍 on 14-3-30.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface XMLUtils : NSObject

/*
 *  通过xml文件路径加载XML对象
 *  @param xmlPath
 */
+ (GDataXMLDocument*)loadXMLFile:(NSString*)xmlPath;

/*
 *  通过xml文件字符串加载XML对象
 *  @param xmlString
 */
+ (GDataXMLDocument*)loadXMLString:(NSString *)xmlString;

/*
 *  通过标签名称，获得命名子节点的字符值
 *  @param node
 *  @param tagName
 *
 */
+ (NSString*)getTagValue:(GDataXMLElement*)node withTagName:(NSString*)tagName;

/*
 *  通过标签名称，获得命名子节点的命名属性字符值
 *  @param node
 *  @param tagName
 *  @param attrName
 *
 */
+ (NSString*)getTagValue:(GDataXMLElement*)node withTagName:(NSString*)tagName withAttributeName:(NSString*)attrName;

/*
 *  通过标签名称，获得命名子节点的数量
 *  @param node
 *  @param tagName
 *
 */
+ (int)countNodes:(GDataXMLElement*)node withTagName:(NSString*)tagName;

/*
 *  通过标签名称，获得唯一命名子节点的集合
 *  @param node
 *  @param tagName
 *
 */
+ (GDataXMLElement*)getSubNode:(GDataXMLElement*)node withTagName:(NSString*)tagName;

/*
 *  通过标签名称，获得命名子节点的集合
 *  @param node
 *  @param tagName
 *
 */
+ (NSArray*)getSubNodes:(GDataXMLElement*)node withTagName:(NSString*)tagName;

/*
 *  通过标签名称，获得命名属性的字符值
 *  @param node
 *  @param attrName
 *
 */
+ (NSString*)getAttributeValue:(GDataXMLElement*)node withAttributeName:(NSString*)attrName;

/*
 *  获得节点所有属性的字符值集合
 *  @param node
 *
 */
+ (NSArray*)getAttributesValue:(GDataXMLElement*)node;

/*
 *  通过标签名称，获得命名子节点或者命名属性的字符值
 *  @param node
 *  @param name
 *
 */
+ (NSString*)getTagOrAttributeValue:(GDataXMLElement*)node withName:(NSString*)name;

@end
