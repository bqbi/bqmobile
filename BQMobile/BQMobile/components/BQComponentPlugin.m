//
//  BQComponentPlugin.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-5.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQComponentPlugin.h"

#import "GDataXMLNode.h"
#import "XMLUtils.h"
#import "BQCore.h"

@implementation BQComponentPlugin

@synthesize name;
@synthesize description;
@synthesize classname;
@synthesize category;
@synthesize categorydesc;

@synthesize container;

@synthesize attributes;
@synthesize attributesMap;
@synthesize signals;
@synthesize slots;


- (id) init {
    if (self = [super init]) {
        attributes = [[NSMutableArray alloc] init];
        attributesMap = [[NSMutableDictionary alloc] init];
        signals = [[NSMutableArray alloc] init];
        slots = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id) initWithNode:(GDataXMLElement*) node {
    if (self = [self init]) {
        if (node) {
            name = [XMLUtils getAttributeValue:node withAttributeName:@"id"];
            description = [XMLUtils getTagValue:node withTagName:@"description"];
            classname = [XMLUtils getTagValue:node withTagName:@"iosClassname"];
            category = [XMLUtils getTagValue:node withTagName:@"category"];
            categorydesc = [XMLUtils getTagValue:node withTagName:@"categorydesc"];
            container = [Common stringToBOOL:[XMLUtils getTagValue:node withTagName:@"container"] withDefault:NO];
            DLog(@"%@--%@--%@--%@--%@--%@",name,description,classname,category,categorydesc,(container?@"YES":@"NO"));
        }
    }
    
    return self;
}

@end
