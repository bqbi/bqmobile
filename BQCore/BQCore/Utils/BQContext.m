//
//  BQContext.m
//  BQCore
//
//  上下文单例对象
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQContext.h"
#import "BQCore.h"
#import "BQServerAccess.h"

@implementation BQContext

// 当前用户
@synthesize currentUser;
// 服务器访问
@synthesize serverAccess;
// 自动登录设置
@synthesize autoLogin;
// 当前样式
@synthesize currentStyle;


// 单例：上下文
static BQContext* _sharedContext = nil;

//  获得上下文单例
+ (BQContext*) sharedContext {
    if (_sharedContext == nil) {
        @synchronized([BQContext class]) {
            if (_sharedContext == nil) {
                _sharedContext = [[self alloc] init];
            }
        }
    }
    return _sharedContext;
}

+ (id) alloc {
    @synchronized([BQContext class]) {
        NSAssert(_sharedContext==nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedContext = [super alloc];
        return _sharedContext;
    }
    return nil;
}


- (id) init {
    if (self = [super init]) {
        serverAccess = [[BQServerAccess alloc] init];
        
        currentStyle = [Common getGlobalStyle];
    }
    
    return self;
}

@end
