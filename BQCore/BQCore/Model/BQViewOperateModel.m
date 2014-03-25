//
//  BQViewOperateModel.m
//  BQCore
//
//  Created by 潘 巍 on 14-3-18.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQViewOperateModel.h"

@implementation BQViewOperateModel

@synthesize oper;
@synthesize content;

- (id) initWithOperator:(BQViewOperator)_oper withContent:(NSDictionary*) _content {
    if(self = [super init]){
        self.oper = _oper;
        self.content = _content;
    }
    return self;
}

- (id) initWithMessage:(NSString*)msg withMessageType:(BQMessageType) type {
    if(self = [super init]){
        self.oper = SHOW_MESSAGE;
        self.content = [[NSMutableDictionary alloc] init];
        [self.content setValue:[NSNumber numberWithInt:type] forKey:PROP_MESSAGE_TYPE];
        [self.content setValue:msg forKey:PROP_MESSAGE_CONTENT];
    }
    return self;
}

@end
