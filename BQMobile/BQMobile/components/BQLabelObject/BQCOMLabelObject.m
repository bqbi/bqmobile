//
//  BQCOMLabelObject.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-16.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCOMLabelObject.h"

#import "BQCore.h"

@implementation BQCOMLabelObject

- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin withContext:(NSMutableDictionary*)context{
    
    if (self = [super initWithNode:node withType:plugin withContext:context]) {
        self.contentView = [self createLabelObject];
    }
    
    return self;
}

- (BQUILabelObject*)createLabelObject{
    
    BQUILabelObject* obj = [[BQUILabelObject alloc] init];
    
    if ([self.attributes objectForKey:COMPONENT_ATTRIBUTE_TEXT]) {
        obj.text = [self.attributes objectForKey:COMPONENT_ATTRIBUTE_TEXT];
    }
    
    if ([self.attributes objectForKey:COMPONENT_ATTRIBUTE_POSITION]) {
        obj.frame = [Common unwrapCGRect:[self.attributes objectForKey:COMPONENT_ATTRIBUTE_POSITION]];
    }
    
    
    return obj;
}

- (void)rerender:(CGRect)frame {
    
}

@end
