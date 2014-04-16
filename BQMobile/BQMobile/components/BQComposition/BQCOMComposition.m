//
//  BQCOMComposition.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-15.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCOMComposition.h"

@implementation BQCOMComposition

- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin {
    
    if (self = [super initWithNode:node withType:plugin]) {
        self.contentView = [[UIScrollView alloc] init];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    }
    
    return self;
}

- (void)rerender:(CGRect)frame {
    if (self.contentView) {
        self.contentView.frame = frame;
    }
    
    if (self.subViews) {
        for (BQComponent* com in self.subViews) {
            [com rerender:frame];
        }
    }
}

@end
