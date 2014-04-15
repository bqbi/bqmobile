//
//  BQTemplateResolver.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-30.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQTemplateResolver.h"

#import "GDataXMLNode.h"
#import "XMLUtils.h"
#import "BQComponentFactory.h"
#import "BQComponentPlugin.h"
#import "BQComponentType.h"
#import "BQComponent.h"

#define COMPONENT_TYPE_BQ_PREFIX @"bq:"

@implementation BQTemplateResolver

+ (BQComponent*) resolverNode:(BQComponentPlugin*)plugin withNode:(GDataXMLNode*)node withRelativePath:(NSString*)relPath {
    BQComponent* view = nil; // TODO
    
    
    
    if (plugin.container) {
        NSArray* subNodes = [node children];
        
        if (subNodes && [subNodes count] > 0) {
            GDataXMLNode* subNode;
            BQComponent* subView;
            for (int i = 0; i < [subNodes count]; i++) {
                subNode = [subNodes objectAtIndex:i];
                subView = [self resolver:subNode withRelativePath:relPath];
                [view addSubview:subView];
            }
        }
    }
    
    return view;
}

+ (BQComponent*)resolver:(GDataXMLNode*)node withRelativePath:(NSString*)relPath {
    NSString* nodeName = [node name];
    
    BQComponentFactory* factory = [BQComponentFactory sharedComponents];
    
    BQComponent* view = nil;
    
    if (nodeName) {
        // 判断是否以bq命名空间空间开头
        if ([nodeName hasPrefix:COMPONENT_TYPE_BQ_PREFIX]) {
            BQComponentPlugin* plugin = [factory.plugins objectForKey:[nodeName lowercaseString]];
            view = [self resolverNode:plugin withNode:node withRelativePath:relPath];
        }
        else {
            DLog(@"无法解析标签%@", nodeName);
        }
        
    }
    
    return view;
}

@end
