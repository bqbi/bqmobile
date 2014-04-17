//
//  BQComponent.h
//  BQMobile
//
//  Created by 潘 巍 on 14-4-15.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"
#import "BQComponentPlugin.h"


@interface BQComponent : NSObject

@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, strong) NSMutableArray* subViews;

@property (nonatomic, strong) NSString* pluginType;

@property (nonatomic, strong) NSMutableDictionary* attributes;

// 通过节点创建组件
- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin;

// 添加子节点
- (void)addSubview:(BQComponent*)subView;

// 重新渲染，包括调整位置
- (void)rerender:(CGRect)frame;

@end
