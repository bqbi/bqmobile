//
//  BQCOMInputText.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-16.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCOMInputText.h"

#import "BQCore.h"

@implementation BQCOMInputText

- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin withContext:(NSMutableDictionary*)context{
    
    if (self = [super initWithNode:node withType:plugin withContext:context]) {
        self.contentView = [self createTextField];
    }
    
    return self;
}

- (BQUITextField*)createTextField{
    
    BQUITextField* obj = [[BQUITextField alloc] init];
    
    // value
    if ([self.attributes objectForKey:COMPONENT_ATTRIBUTE_VALUE]) {
        obj.text = [self.attributes objectForKey:COMPONENT_ATTRIBUTE_VALUE];
    }
    
    // borderStyle
    if ([self.attributes objectForKey:COMPONENT_ATTRIBUTE_BORDER_STYLE]) {
        obj.borderStyle = [Common unwrapInt:[self.attributes objectForKey:COMPONENT_ATTRIBUTE_BORDER_STYLE]];
    }
    
    // position
    if ([self.attributes objectForKey:COMPONENT_ATTRIBUTE_POSITION]) {
        obj.frame = [Common unwrapCGRect:[self.attributes objectForKey:COMPONENT_ATTRIBUTE_POSITION]];
    }
    
    
    return obj;
}

- (void)rerender:(CGRect)frame {
    
}

@end
