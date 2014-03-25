//
//  BQViewOperateModel.h
//  BQCore
//
//  Created by 潘 巍 on 14-3-18.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

// 页面操作类型
typedef enum {
    SHOW_MESSAGE = 0,   // 显示信息
    OPERATE_UPDATE,     // 更新
    OPERATE_APPEND,     // 添加
    OPERATE_REMOVE,     // 移除
    OPERATE_EMPTY,      // 清空
    OPERATE_BEFORE,     // 前插入
    OPERATE_AFTER,      // 后插入
    OPERATE_CUSTOM      // 自定义
} BQViewOperator;

// 页面消息类型
typedef enum {
    MESSAGE_TYPE_INFO = 0,  // 提示
    MESSAGE_TYPE_WARNING,   // 警告
    MESSAGE_TYPE_ERROR      // 错误
} BQMessageType;

#define PROP_MESSAGE_TYPE @"MessageType"
#define PROP_MESSAGE_CONTENT @"MessageContent"
#define PROP_VIEW_OPERATOR @"ViewOperator"
#define PROP_VIEW_CONTENT @"ViewContent"

@interface BQViewOperateModel : NSObject

// 页面操作符
@property (nonatomic) BQViewOperator oper;

// 页面内容
@property (nonatomic, retain) NSDictionary* content;

- (id) initWithOperator:(BQViewOperator)_oper withContent:(NSDictionary*) _content;

- (id) initWithMessage:(NSString*)msg withMessageType:(BQMessageType)type;

@end
