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

#define COMPONENT_TYPE_BQ_PREFIX @"bq:"

@implementation BQTemplateResolver

+ (BQComponentView*) resolverNode:(BQComponentPlugin*)plugin withNode:(GDataXMLNode*)node withRelativePath:(NSString*)relPath {
    BQComponentView* view = nil; // TODO
    
    
    
    if (plugin.container) {
        NSArray* subNodes = [node children];
        
        if (subNodes && [subNodes count] > 0) {
            GDataXMLNode* subNode;
            BQComponentView* subView;
            for (int i = 0; i < [subNodes count]; i++) {
                subNode = [subNodes objectAtIndex:i];
                subView = [self resolver:subNode withRelativePath:relPath];
                [view addSubview:subView];
            }
        }
    }
    
    return view;
}

+ (BQComponentView*)resolver:(GDataXMLNode*)node withRelativePath:(NSString*)relPath {
    NSString* nodeName = [node name];
    
    BQComponentFactory* factory = [BQComponentFactory sharedComponents];
    
    BQComponentView* view = nil;
    
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
