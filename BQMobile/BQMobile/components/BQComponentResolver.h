//
//  BQComponentResolver.h
//  BQMobile
//
//  Created by 潘 巍 on 14-4-9.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GDataXMLNode.h"

@interface BQComponentResolver : NSObject

+ (id) createComponentView:(GDataXMLElement*)el;

@end
