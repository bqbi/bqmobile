//
//  BQComponentView.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-29.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//
#import "GDataXMLNode.h"

@interface BQComponentView : UIView

// 通过节点创建组件
- (id)initWithNode:(GDataXMLNode*)node;

@end
