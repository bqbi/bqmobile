//
//  BQComponent.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-15.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQComponent.h"

@implementation BQComponent

@synthesize contentView;
@synthesize subViews;

@synthesize pluginType;

@synthesize properties;

- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin {
    if (self = [self init]) {
        subViews = [[NSMutableArray alloc] init];
        
        pluginType = plugin.name;
        
        // 抽取属性
        // 1.来着默认皮肤的属性
    }
    return self;
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
