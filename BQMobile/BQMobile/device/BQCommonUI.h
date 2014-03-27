//
//  BQCommonUI.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-19.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BQCommonUI : NSObject

// 获得主窗口
+ (UIWindow*) getMainWindow;

// 显示加载视图
+ (void)showLoadView;

// 隐藏加载视图
+ (void)hideLoadView;

// 消息框
+ (void)msgBox:(NSString*)msg;

// 错误框
+ (void)errBox:(NSString*)msg;

// 是否问询框
+ (int)askBox:(NSString*)msg;

// 自定义问询框
+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0;

+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 withButton1:(NSString*)button1;

+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 withButton1:(NSString*)button1 withButton2:(NSString*)button2;

+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 withButton1:(NSString*)button1 withButton2:(NSString*)button2 withButton3:(NSString*)button3;

+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 withButton1:(NSString*)button1 withButton2:(NSString*)button2 withButton3:(NSString*)button3 withButton4:(NSString*)button4;


@end
