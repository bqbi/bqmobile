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

#define COMPONENT_TYPE_BQ_PREFIX @"bq:"

@implementation BQTemplateResolver

+ (void) resolverSubNode:(GDataXMLNode*)node withParentComponent:(UIView*)parentView {
    NSArray* subNodes = [node children];
    
    if (!subNodes || [subNodes count] == 0) {
        return;
    }
    
    GDataXMLNode* subNode;
    for (int i = 0; i < [subNodes count]; i++) {
        subNode = [subNodes objectAtIndex:i];
    }
}

+ (void) resolverNode:(GDataXMLNode*)node withParentComponent:(UIView*)parentView {
    NSString* nodeName = [node name];
    
    if ([nodeName hasPrefix:COMPONENT_TYPE_BQ_PREFIX]) {
        DLog(@"----nodeName----:%@", nodeName);
    } else {
        DLog(@"?????nodeName?????:%@", nodeName);
    }
}

@end
