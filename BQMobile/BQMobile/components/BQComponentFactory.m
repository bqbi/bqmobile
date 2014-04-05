//
//  BQComponentFactory.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-31.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQComponentFactory.h"

#import "BQCore.h"
#import "BQComponentPlugin.h"

#define XML_FILE_FLY_COMPONENTS @"META-INF/bq-m-composition.xml"
#define XML_FILE_FLY_COMPONENTS_ENTITY_PREFIX @"META-INF/entities/"
#define XML_FILE_FLY_COMPONENTS_ATTRIBUTE_PREFIX @"META-INF/entities/attributes/"

@implementation BQComponentFactory

@synthesize plugins;

// 单例：组件配置工厂
static BQComponentFactory* _sharedComponents = nil;

+ (BQComponentFactory*) sharedComponents {
    if (_sharedComponents == nil) {
        @synchronized([BQComponentFactory class]) {
            if (_sharedComponents == nil) {
                _sharedComponents = [[self alloc] init];
            }
        }
    }
    return _sharedComponents;
}

+ (id) alloc {
    @synchronized([BQComponentFactory class]) {
        NSAssert(_sharedComponents==nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedComponents = [super alloc];
        return _sharedComponents;
    }
    return nil;
}

- (id) init {
    if (self = [super init]) {
        plugins = [[NSMutableDictionary alloc] init];
        
        [self initComponents];
    }
    return self;
}

- (void) initComponents {
    GDataXMLDocument* document = [self getComponentSettingDocument];
    
    GDataXMLElement* componentsNode = [document rootElement];
    
    NSArray* componentNodes = [XMLUtils getSubNodes:componentsNode withTagName:@"component"];
    
    for (GDataXMLElement* node in componentNodes) {
        [self initComponent:[node stringValue]];
    }
    
}

- (void) initComponent:(NSString*)componentFileName {
    GDataXMLDocument* document = [self getComponentDocument:componentFileName];
    GDataXMLElement* component = [document rootElement];
    
    BQComponentPlugin* plugin = [[BQComponentPlugin alloc] init];
    
}

- (GDataXMLDocument*) getComponentSettingDocument {
    return [XMLUtils loadXMLFile:resourceBundleAndRelative(@"Component",XML_FILE_FLY_COMPONENTS)];
}

- (GDataXMLDocument*) getComponentDocument:(NSString*)fileName {
    NSString* relpath = [NSString stringWithFormat:@"%@/%@",XML_FILE_FLY_COMPONENTS_ENTITY_PREFIX,fileName];
    return [XMLUtils loadXMLFile:resourceBundleAndRelative(@"Component",relpath)];
}

@end
