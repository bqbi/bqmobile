//
//  BQComponentPlugin.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-5.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQComponentPlugin.h"
#import "BQTemplateResolver.h"
#import "GDataXMLNode.h"
#import "XMLUtils.h"
#import "BQCore.h"

@implementation BQComponentPlugin

@synthesize name;
@synthesize description;
@synthesize classname;
@synthesize category;
@synthesize categorydesc;

@synthesize container;

@synthesize attributesMap;
@synthesize signals;
@synthesize slots;


- (id) init {
    if (self = [super init]) {
        attributesMap = [[NSMutableDictionary alloc] init];
        signals = [[NSMutableArray alloc] init];
        slots = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id) initWithNode:(GDataXMLElement*) node {
    if (self = [self init]) {
        if (node) {
            name = [XMLUtils getAttributeValue:node withAttributeName:@"id"];
            description = [XMLUtils getTagValue:node withTagName:@"description"];
            classname = [XMLUtils getTagValue:node withTagName:@"iosClassname"];
            category = [XMLUtils getTagValue:node withTagName:@"category"];
            categorydesc = [XMLUtils getTagValue:node withTagName:@"categorydesc"];
            container = [Common stringToBOOL:[XMLUtils getTagValue:node withTagName:@"container"] withDefault:NO];
            
            DLog(@"%@--%@--%@--%@--%@--%@",name,description,classname,category,categorydesc,(container?@"YES":@"NO"));
            
            [self initAttributes:node];
        }
    }
    
    return self;
}

- (void) initAttributes:(GDataXMLElement*) node {
    GDataXMLElement* attrsNode = [XMLUtils getSubNode:node withTagName:@"attributes"];
    if (attrsNode) {
        NSArray* attrNodeArr = [XMLUtils getSubNodes:attrsNode withTagName:@"attribute"];
        for (GDataXMLElement* a in attrNodeArr) {
            BQComponentAttribute* attr = [[BQComponentAttribute alloc] initWithNode:a];
            [self.attributesMap setObject:attr forKey:attr.name];
        }
    }
}

@end



@implementation BQComponentAttribute

@synthesize name;
@synthesize required;
@synthesize type;
@synthesize defaultString;

- (id) initWithNode:(GDataXMLElement*)node {
    if (self = [self init]) {
        if (node) {
            name = [XMLUtils getTagValue:node withTagName:@"name"];
            required = [Common stringToBOOL:[XMLUtils getTagValue:node withTagName:@"required"] withDefault:NO];
            type = [self getTypeValue:[XMLUtils getTagValue:node withTagName:@"type"]];
            defaultString = [XMLUtils getTagValue:node withTagName:@"default"];
        }
    }
    return self;
}

- (enum COMPONENT_ATTRIBUTE_TYPE) getTypeValue:(NSString*)typeString {
    if ([Common isStringEmpty:typeString]) {
        return COMPONENT_ATTRIBUTE_TYPE_STRING;
    } else if([Common isEqualIgnoreCaseToString:typeString withSecondString:@"String"]) {
        return COMPONENT_ATTRIBUTE_TYPE_STRING;
    } else if([Common isEqualIgnoreCaseToString:typeString withSecondString:@"Boolean"]) {
        return COMPONENT_ATTRIBUTE_TYPE_BOOLEAN;
    } else if([Common isEqualIgnoreCaseToString:typeString withSecondString:@"Integer"]) {
        return COMPONENT_ATTRIBUTE_TYPE_INTEGER;
    } else if([Common isEqualIgnoreCaseToString:typeString withSecondString:@"Double"]) {
        return COMPONENT_ATTRIBUTE_TYPE_DOUBLE;
    } else if([Common isEqualIgnoreCaseToString:typeString withSecondString:@"RECT"]) {
        return COMPONENT_ATTRIBUTE_TYPE_RECT;
    } else if([Common isEqualIgnoreCaseToString:typeString withSecondString:@"POINT"]) {
        return COMPONENT_ATTRIBUTE_TYPE_POINT;
    } else if([Common isEqualIgnoreCaseToString:typeString withSecondString:@"Object"]) {
        return COMPONENT_ATTRIBUTE_TYPE_OBJECT;
    }
    return COMPONENT_ATTRIBUTE_TYPE_STRING;
}

+ (id) getUndefinedAttributeValue:(NSString*)valueString withContext:(NSMutableDictionary*)context {
    if ([Common isStringEmpty:valueString]) {
        return nil;
    }
    // 对于未定义的属性，一律认为是String型
    return [BQTemplateResolver getExpressionValue:valueString withContext:context];
}

- (id) getAttributeValue:(NSString*)valueString withContext:(NSMutableDictionary*)context {
    
    id val = nil;
    
    // 如果为空直接返回nil
    if ([Common isStringEmpty:valueString]) {
        return val;
    }
    
    // 输入是对象类型，直接从上下文中返回对象 TODO
    if (type == COMPONENT_ATTRIBUTE_TYPE_OBJECT) {
        return [BQTemplateResolver getExpressionObjectValue:valueString withContext:context];
    }
    
    valueString = [BQTemplateResolver getExpressionValue:valueString withContext:context];
    
    switch (type) {
        case COMPONENT_ATTRIBUTE_TYPE_STRING:
            val = valueString;
            break;
        case COMPONENT_ATTRIBUTE_TYPE_BOOLEAN:
            val = [Common wrapBOOL:[Common stringToBOOL:valueString]];
            break;
        case COMPONENT_ATTRIBUTE_TYPE_INTEGER:
            val = [Common wrapInt:[Common stringToInt:valueString]];
            break;
        case COMPONENT_ATTRIBUTE_TYPE_DOUBLE:
            val = [Common wrapDouble:[Common stringToDouble:valueString]];
            break;
        case COMPONENT_ATTRIBUTE_TYPE_RECT:
            val = [Common wrapCGRect:[Common stringToCGRect:valueString]];
            break;
        case COMPONENT_ATTRIBUTE_TYPE_POINT:
            val = [Common wrapCGPoint:[Common stringToCGPoint:valueString]];
            break;
        default:
            val = valueString;
    }
    
    
    return val;
}

@end
