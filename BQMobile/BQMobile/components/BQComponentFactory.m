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

#define XML_FILE_BQ_COMPONENTS @"META-INF/bq-m-composition.xml"
#define XML_FILE_BQ_COMPONENTS_ENTITY_PREFIX @"META-INF/entities"
#define XML_FILE_BQ_COMPONENTS_ATTRIBUTE_PREFIX @"META-INF/entities/attributes"

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
    
    BQComponentPlugin* plugin = [[BQComponentPlugin alloc] initWithNode:component];
    
    if (plugin.name) {
        [plugins setObject:plugin forKey:[plugin.name lowercaseString]];
    }
}

- (GDataXMLDocument*) getComponentSettingDocument {
    return [XMLUtils loadXMLFile:resourceBundleAndRelative(@"Component",XML_FILE_BQ_COMPONENTS)];
}

- (GDataXMLDocument*) getComponentDocument:(NSString*)fileName {
    NSString* relpath = [NSString stringWithFormat:@"%@/%@",XML_FILE_BQ_COMPONENTS_ENTITY_PREFIX,fileName];
    
    BQFileReader* reader = [[BQFileReader alloc]initWithFilePath:resourceBundleAndRelative(@"Component",relpath)];
    NSString* line = nil;
    NSMutableArray* arr = [[NSMutableArray alloc]init];
    while ((line = [reader readLine])) {
        line = [Common trim:line];
        
        if (line == nil) {
            continue;
        }
        
        if ([line hasPrefix:@"&"]) {
            line = [self getComponentPart:[line substringFromIndex:1]];
        }
        [arr addObject:line];
    }
    
    return [XMLUtils loadXMLString:[arr componentsJoinedByString:@""]];
}

- (NSString*) getComponentPart:(NSString*)fileName {
    NSString* relpath = [NSString stringWithFormat:@"%@/%@%@",XML_FILE_BQ_COMPONENTS_ATTRIBUTE_PREFIX,fileName,@".xml"];
    return [FSUtils readFile:resourceBundleAndRelative(@"Component",relpath)];
}

@end
