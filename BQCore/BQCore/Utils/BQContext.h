//
//  BQContext.h
//  BQCore
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BQServerAccess;

@interface BQContext : NSObject

@property (nonatomic, retain) NSString* currentUser;
@property (nonatomic, retain) BQServerAccess* serverAccess;
@property (nonatomic, retain) NSString* autoLogin;

//  获得上下文单例
+ (BQContext*) sharedContext;

//  获得全局参数
+ (id)getGlobalVar:(NSString*)name;

//  设置全局参数
+ (void)setGlobalVar:(id)var forName:(NSString*)name;

//  获取全局风格
+ (NSString*) getGlobalStyle;

//  设置全局风格
+ (void) setGlobalStyle:(NSString*) style;

@end
