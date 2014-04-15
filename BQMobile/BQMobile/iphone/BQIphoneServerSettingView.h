//
//  BQServerSettingView.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQView.h"

typedef NS_OPTIONS(NSUInteger, ServerInfoCtrlTag)
{
    ServerInfoCtrlTag_Address = 100,
    ServerInfoCtrlTag_Port    = 101
};

@protocol ServerInfoSaveButtonDelegate <NSObject>

@optional
- (void) onButtonClick:(id) sender;

@end

@interface BQIphoneServerSettingView : BQView

// 服务器地址
@property (nonatomic, retain, readonly) UITextField * server;
// 端口
@property (nonatomic, retain, readonly) UITextField * port;
//
@property (nonatomic, retain, readonly) UIButton * saveButton;

// 代理保存
@property (nonatomic, retain) id<ServerInfoSaveButtonDelegate> delegate;
@end
