//
//  BQCOMLabelObject.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-16.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCOMLabelObject.h"

@implementation BQCOMLabelObject

- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin {
    
    if (self = [super initWithNode:node withType:plugin]) {
        self.contentView = [self createLabelObject];
    }
    
    return self;
}

- (BQUILabelObject*)createLabelObject{
    
    BQUILabelObject* obj = [[BQUILabelObject alloc] init];
    
    obj.frame = CGRectMake(0, 0, 10000, 40);
    
    if ([self.attributes objectForKey:@"text"]) {
        obj.text = [self.attributes objectForKey:@"text"];
    }
    
    return obj;
}

@end
