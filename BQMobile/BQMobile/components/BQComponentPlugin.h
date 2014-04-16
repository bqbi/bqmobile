//
//  BQComponentPlugin.h
//  BQMobile
//
//  Created by 潘 巍 on 14-4-5.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GDataXMLElement;


enum COMPONENT_ATTRIBUTE_TYPE {
    COMPONENT_ATTRIBUTE_TYPE_STRING = 0, // String
    COMPONENT_ATTRIBUTE_TYPE_BOOLEAN = 1, // Boolean
    COMPONENT_ATTRIBUTE_TYPE_Integer = 2, // Integer
    COMPONENT_ATTRIBUTE_TYPE_DOUBLE = 3, // Double
};



@interface BQComponentPlugin : NSObject

@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSString* description;
@property (nonatomic, readonly) NSString* classname;
@property (nonatomic, readonly) NSString* category;
@property (nonatomic, readonly) NSString* categorydesc;
@property (nonatomic, readonly) BOOL container;

@property (nonatomic, readonly) NSMutableDictionary* attributesMap;
@property (nonatomic, readonly) NSArray* signals;
@property (nonatomic, readonly) NSArray* slots;

- (id) initWithNode:(GDataXMLElement*) node;

@end


@interface BQComponentAttribute : NSObject

@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) BOOL required;
@property (nonatomic, readonly) int type;
@property (nonatomic, readonly) NSString* defaultString;

- (id) initWithNode:(GDataXMLElement*)node;

@end
