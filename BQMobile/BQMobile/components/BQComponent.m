//
//  BQComponent.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-15.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQComponent.h"

#import "BQComponentFactory.h"
#import "BQComponentPlugin.h"

#import "BQCore.h"

@implementation BQComponent

@synthesize contentView;
@synthesize subViews;

@synthesize pluginType;

@synthesize attributes;

- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin withContext:(NSMutableDictionary*)context {
    if (self = [self init]) {
        subViews = [[NSMutableArray alloc] init];
        
        pluginType = plugin.name;
        
        attributes = [[NSMutableDictionary alloc] init];
        
        // 抽取属性
        // 1.来着默认皮肤的属性
        [self setDefaultAttribute:plugin withContext:context];
        
        // 2.来着节点设置的属性
        [self setNodeAttribute:node withType:plugin withContext:context];
        
    }
    return self;
}

- (void)setNodeAttribute:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin withContext:(NSMutableDictionary*)context {
    NSDictionary* attrDic = [XMLUtils getAttributesValue:(GDataXMLElement*)node];
    NSString* val;
    BQComponentAttribute* attr;
    
    for (NSString* key in [attrDic allKeys]) {
        attr = [plugin.attributesMap objectForKey:key];
        val = [attrDic objectForKey:key];
        
        if (![Common isStringEmpty:val]) {
            if (attr) {
                [attributes setObject:[attr getAttributeValue:val withContext:context] forKey:key];
            } else {
                [attributes setObject:[BQComponentAttribute getUndefinedAttributeValue:val withContext:context] forKey:key];
            }
        } else {
            [attributes removeObjectForKey:key];
        }
    }
}

- (void)setDefaultAttribute:(BQComponentPlugin*)plugin withContext:(NSMutableDictionary*)context {
    NSDictionary* dic = [BQComponentFactory getGlabelStyleComponents];
    NSDictionary* com = [dic objectForKey:[plugin.name lowercaseString]];
    
    NSString* val;
    BQComponentAttribute* attr;
    
    for (NSString* key in [com allKeys]) {
        attr = [plugin.attributesMap objectForKey:key];
        val = [com objectForKey:key];
        
        if (![Common isStringEmpty:val]) {
            if (attr) {
                [attributes setObject:[attr getAttributeValue:val withContext:context] forKey:key];
            } else {
                [attributes setObject:[BQComponentAttribute getUndefinedAttributeValue:val withContext:context] forKey:key];
            }
        } else {
            [attributes removeObjectForKey:key];
        }
        
    }
}

- (void)addSubview:(BQComponent*)subView {
    
    [self.subViews addObject:subView];
    
    if (contentView) {
        [contentView addSubview:subView.contentView];
    }
}

- (void)rerender:(CGRect)frame {
    
}

@end
