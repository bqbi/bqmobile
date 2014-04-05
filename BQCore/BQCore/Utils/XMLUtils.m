//
//  XMLUtils.m
//  BQCore
//
//  Created by 潘 巍 on 14-3-30.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "XMLUtils.h"

@implementation XMLUtils

/*
 *  通过xml文件路径加载XML对象
 *  @param xmlPath
 */
+ (GDataXMLDocument*)loadXMLFile:(NSString*)xmlPath {
    NSString* xmlString = [NSString stringWithContentsOfFile:xmlPath encoding:NSUTF8StringEncoding error:nil];
    return [self loadXMLString:xmlString];
}

/*
 *  通过xml文件字符串加载XML对象
 *  @param xmlString
 */
+ (GDataXMLDocument*)loadXMLString:(NSString *)xmlString {
    GDataXMLDocument* xmlDoc = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil];
    return xmlDoc;
}

/*
 *  通过标签名称，获得命名子节点的字符值
 *  @param node
 *  @param tagName
 *
 */
+ (NSString*)getTagValue:(GDataXMLElement*)node withTagName:(NSString*)tagName {
    
    if (!node) {
        return nil;
    }

    NSArray* children = [node children];
    GDataXMLElement* childNode;
    
    // 返回命名子节点的字符值
    for (int i = 0; i < [children count]; i++) {
        childNode = [children objectAtIndex:i];
        if ([[childNode name] isEqualToString:tagName]) {
            return [childNode stringValue];
        }
    }
    
    return nil;
    
}

/*
 *  通过标签名称，获得命名子节点的命名属性字符值
 *  @param node
 *  @param tagName
 *  @param attrName
 *
 */
+ (NSString*)getTagValue:(GDataXMLElement*)node withTagName:(NSString*)tagName withAttributeName:(NSString*)attrName {
    if (!node) {
        return nil;
    }
    
    NSArray* children = [node children];
    GDataXMLElement* childNode;
    
    for (int i = 0; i < [children count]; i++) {
        childNode = [children objectAtIndex:i];
        if ([[childNode name] isEqualToString:tagName]) {
            return [[childNode attributeForName:attrName] stringValue];
        }
    }
    
    return nil;
}

/*
 *  通过标签名称，获得命名子节点的数量
 *  @param node
 *  @param tagName
 *
 */
+ (int)countNodes:(GDataXMLElement*)node withTagName:(NSString*)tagName {
    if (!node) {
        return 0;
    }
    
    int count = 0;
    NSArray* children = [node children];
    GDataXMLElement* childNode;
    
    for (int i = 0; i < [children count]; i++) {
        childNode = [children objectAtIndex:i];
        if ([[childNode name] isEqualToString:tagName]) {
            count++;
        }
    }
    
    return count;
    
}

/*
 *  通过标签名称，获得唯一命名子节点的集合
 *  @param node
 *  @param tagName
 *
 */
+ (GDataXMLElement*)getSubNode:(GDataXMLElement*)node withTagName:(NSString*)tagName {
    if (!node) {
        return nil;
    }
    
    NSArray* children = [node children];
    GDataXMLElement* childNode;
    
    for (int i = 0; i < [children count]; i++) {
        childNode = [children objectAtIndex:i];
        if ([[childNode name] isEqualToString:tagName]) {
            return childNode;
        }
    }
    
    return nil;
}

/*
 *  通过标签名称，获得命名子节点的集合
 *  @param node
 *  @param tagName
 *
 */
+ (NSArray*)getSubNodes:(GDataXMLElement*)node withTagName:(NSString*)tagName {
    if (!node) {
        return nil;
    }
    
    NSMutableArray* subNodes = [[NSMutableArray alloc] init];
    NSArray* children = [node children];
    GDataXMLElement* childNode;
    
    for (int i = 0; i < [children count]; i++) {
        childNode = [children objectAtIndex:i];
        if ([[childNode name] isEqualToString:tagName]) {
            [subNodes addObject:childNode];
        }
    }
    
    return subNodes;
}

/*
 *  通过标签名称，获得命名属性的字符值
 *  @param node
 *  @param attrName
 *
 */
+ (NSString*)getAttributeValue:(GDataXMLElement*)node withAttributeName:(NSString*)attrName {
    if (node) {
        return [[node attributeForName:attrName] stringValue];
    }
    return nil;
}

/*
 *  获得节点所有属性的字符值集合
 *  @param node
 *
 */
+ (NSArray*)getAttributesValue:(GDataXMLElement*)node {
    if (!node) {
        return nil;
    }
    
    NSMutableArray* attrsValue = [[NSMutableArray alloc] init];
    NSArray* attrsNode = [node attributes];
    GDataXMLNode* attrNode;
    
    for (int i = 0; i < [attrsNode count]; i++) {
        attrNode = [attrsNode objectAtIndex:i];
        [attrsValue addObject:[attrNode stringValue]];
    }
    
    return attrsValue;
}

/*
 *  通过标签名称，获得命名子节点或者命名属性的字符值
 *  @param node
 *  @param name
 *
 */
+ (NSString*)getTagOrAttributeValue:(GDataXMLElement*)node withName:(NSString*)name {
    NSString* string;
    string = [self getTagValue:node withTagName:name];
    if (string) {
        return string;
    }
    return [self getAttributeValue:node withAttributeName:name];
}

@end
