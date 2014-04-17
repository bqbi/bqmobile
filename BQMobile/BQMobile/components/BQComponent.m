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

- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin {
    if (self = [self init]) {
        subViews = [[NSMutableArray alloc] init];
        
        pluginType = plugin.name;
        
        attributes = [[NSMutableDictionary alloc] init];
        
        // 抽取属性
        // 1.来着默认皮肤的属性
        [self setDefaultAttribute:plugin];
        
        // 2.来着节点设置的属性
        [self setNodeAttribute:node withType:plugin];
        
    }
    return self;
}

- (void)setNodeAttribute:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin {
    NSDictionary* attrDic = [XMLUtils getAttributesValue:(GDataXMLElement*)node];
    
    for (NSString* key in [attrDic allKeys]) {
        BQComponentAttribute* attr = [plugin.attributesMap objectForKey:key];
        if (attr) {
            [attributes setObject:[attr getAttributeValue:[attrDic objectForKey:key]] forKey:key];
        } else {
            [attributes setObject:[BQComponentAttribute getUndefinedAttributeValue:[attrDic objectForKey:key]] forKey:key];
        }
    }
}

- (void)setDefaultAttribute:(BQComponentPlugin*)plugin {
    NSDictionary* dic = [BQComponentFactory getGlabelStyleComponents];
    NSDictionary* com = [dic objectForKey:[plugin.name lowercaseString]];
    
    for (NSString* key in [com allKeys]) {
        BQComponentAttribute* attr = [plugin.attributesMap objectForKey:key];
        if (attr) {
            [attributes setObject:[attr getAttributeValue:[com objectForKey:key]] forKey:key];
        } else {
            [attributes setObject:[BQComponentAttribute getUndefinedAttributeValue:[com objectForKey:key]] forKey:key];
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
