//
//  BQTemplateResolver.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-30.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GDataXMLNode;
@class BQComponentView;

@interface BQTemplateResolver : NSObject

+ (BQComponentView*)resolver:(GDataXMLNode*)node withRelativePath:(NSString*)relPath;

@end
