//
//  BQServerAccess.m
//  BQCore
//
//  服务器访问对象
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQServerAccess.h"

#import "FSUtils.h"

@implementation BQServerAccess

@synthesize userName, serverUrl, serverKey;

/*
 *  获得当前服务器的缓冲路径
 *
 *
 */
- (NSString*) getCachePath:(BOOL)autoCreate {
    if (serverKey == nil) {
        serverKey = @"Default";
    }
    
    NSString* cachePath = [NSString stringWithFormat:@"%@/Cache/%@", [FSUtils getDocPath], serverKey];
    
    if (autoCreate) {
        [FSUtils createDirectory:cachePath];
    }
    
    return cachePath;
}

@end
