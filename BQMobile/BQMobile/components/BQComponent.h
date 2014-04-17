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

// 组件属性集合
#define COMPONENT_ATTRIBUTE_TEXT @"text"
#define COMPONENT_ATTRIBUTE_VALUE @"value"
#define COMPONENT_ATTRIBUTE_POSITION @"position"

#define COMPONENT_ATTRIBUTE_BORDER_STYLE @"borderStyle"


@interface BQComponent : NSObject

@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, strong) NSMutableArray* subViews;

@property (nonatomic, strong) NSString* pluginType;

@property (nonatomic, strong) NSMutableDictionary* attributes;

// 通过节点创建组件
- (id)initWithNode:(GDataXMLNode*)node withType:(BQComponentPlugin*)plugin withContext:(NSMutableDictionary*)context;

// 添加子节点
- (void)addSubview:(BQComponent*)subView;

// 重新渲染，包括调整位置
- (void)rerender:(CGRect)frame;

@end
