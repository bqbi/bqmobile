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

@property (nonatomic, retain) NSString* currentStyle;

//  获得上下文单例
+ (BQContext*) sharedContext;

@end
