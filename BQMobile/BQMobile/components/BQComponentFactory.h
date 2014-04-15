//
//  BQComponentFactory.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-31.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface BQComponentFactory : NSObject

// 组件插件集合
@property (nonatomic, readonly) NSMutableDictionary* plugins;

+ (BQComponentFactory*) sharedComponents;

@end
