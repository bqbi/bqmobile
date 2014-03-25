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
#import "FSUtils.h"
#import "BQServerAccess.h"

@implementation BQContext

// 当前用户
@synthesize currentUser;
// 服务器访问
@synthesize serverAccess;
// 自动登录设置
@synthesize autoLogin;


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

//  获得全局参数
+ (id)getGlobalVar:(NSString*)name {
    return [Common getGlobalParameter:name];
}

//  设置全局参数
+ (void)setGlobalVar:(id)var forName:(NSString*)name {
    [Common setCustomParameter:var forName:name];
}

//  获取全局风格
+ (NSString*) getGlobalStyle {
    NSString* style = nil;
    if ([Common isStringEmpty:style]) {
        style = [Common getGlobalParameter:PARAMETER_LAST_UI_STYLE];
    }
    if ([Common isStringEmpty:style]) {
        style = [Common getGlobalParameter:GLOBAL_UI_STYLE];

    }
    return style;
}

//  设置全局风格
+ (void) setGlobalStyle:(NSString*) style {
    if ([Common isStringEmpty:style]) {
        style = [Common getGlobalParameter:GLOBAL_UI_STYLE];
    }
    
    // 保持文件
    [self setGlobalVar:style forName:PARAMETER_LAST_UI_STYLE];
}

- (id) init {
    if (self = [super init]) {
        serverAccess = [[BQServerAccess alloc] init];
    }
    
    return self;
}

@end
