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

- (id)initWithNode:(GDataXMLNode*)node {
    if (self = [self init]) {
        subViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addSubview:(BQComponent*)subView {
    
    [self.subViews addObject:subViews];
    
    if (contentView) {
        [contentView addSubview:subView.contentView];
    }
}

@end
