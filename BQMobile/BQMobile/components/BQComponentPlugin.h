//
//  BQComponentPlugin.h
//  BQMobile
//
//  Created by 潘 巍 on 14-4-5.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BQComponentPlugin : NSObject

@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSString* description;
@property (nonatomic, readonly) NSString* classname;
@property (nonatomic, readonly) NSString* category;
@property (nonatomic, readonly) NSString* categorydesc;
@property (nonatomic, readonly) NSString* tooltip;
@property (nonatomic, readonly) NSString* iconfile;
@property (nonatomic, readonly) BOOL ignoreInDesigner;
@property (nonatomic, readonly) BOOL container;

@property (nonatomic, readonly) NSArray* attributes;
@property (nonatomic, readonly) NSDictionary* attributesMap;
@property (nonatomic, readonly) NSArray* signals;
@property (nonatomic, readonly) NSArray* slots;



@end