//
//  BQCOMComposition.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-15.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCOMComposition.h"

@implementation BQCOMComposition

- (id)initWithNode:(GDataXMLNode*)node {
    
    if (self = [super initWithNode:node]) {
        self.contentView = [[UIScrollView alloc] init];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    }
    
    return self;
}

- (void)rerender:(CGRect)frame {
    self.contentView.frame = frame;
    
    // 渲染子组件 TODO
}

@end
