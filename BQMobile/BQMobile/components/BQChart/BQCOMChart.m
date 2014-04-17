//
//  BQCOMChart.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-16.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCOMChart.h"

#import "BQCore.h"

@implementation BQCOMChart

- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin withContext:(NSMutableDictionary*)context{
    
    if (self = [super initWithNode:node withType:plugin withContext:context]) {
        self.contentView = [self createChart];
    }
    
    return self;
}

- (BQUIChart*)createChart{
    
    BQUIChart* obj = [[BQUIChart alloc] init];
    
    NSString* resPath = [FSUtils getResourcePath:@"Component" withRelativePath:@"BQChart/1.html"];
    
    NSString* html = [FSUtils readFile:resPath];
    
    [obj loadHTMLString:html baseURL:[NSURL fileURLWithPath:resPath]];
    
    // position
    if ([self.attributes objectForKey:COMPONENT_ATTRIBUTE_POSITION]) {
        obj.frame = [Common unwrapCGRect:[self.attributes objectForKey:COMPONENT_ATTRIBUTE_POSITION]];
    }
    
    
    return obj;
}

- (void)rerender:(CGRect)frame {
    
}

@end
