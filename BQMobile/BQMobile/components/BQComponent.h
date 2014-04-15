//
//  BQComponent.h
//  BQMobile
//
//  Created by 潘 巍 on 14-4-15.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface BQComponent : NSObject

@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, strong) NSMutableArray* subViews;

// 通过节点创建组件
- (id)initWithNode:(GDataXMLNode*)node;

- (void)addSubview:(UIView*)subView;

@end
