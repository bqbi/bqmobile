//
//  BQCommonUI.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-19.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCommonUI.h"

#import "BQAlertView.h"
#import "BQLoadView.h"

@implementation BQCommonUI

static BQLoadView* _globalLoadView = nil;

+ (BQLoadView*)globalLoadView {
    if (_globalLoadView == nil) {
        @synchronized([BQLoadView class]) {
            if (_globalLoadView == nil) {
                _globalLoadView = [[BQLoadView alloc] init];
            }
        }
    }
    return _globalLoadView;
}

// 获得主窗口
+ (UIWindow*) getMainWindow {
    NSArray* windows = [UIApplication sharedApplication].windows;
    if (windows && [windows count] > 0) {
        return [windows objectAtIndex:0];
    }
    return nil;
}

// 显示加载视图
+ (void)showLoadView {
    UIWindow* mainWindow = [self getMainWindow];
    BQLoadView* loadView = [self globalLoadView];
    [mainWindow addSubview:loadView];
    [loadView showLoadView];
}

// 隐藏加载视图
+ (void)hideLoadView {
    BQLoadView* loadView = [self globalLoadView];
    [loadView hideLoadView];
    [loadView removeFromSuperview];
}

// 消息框
+ (void)msgBox:(NSString*)msg {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg
                        delegate:nil cancelButtonTitle:@"确 定"
                        otherButtonTitles:nil];
    [alert show];
}

// 错误框
+ (void)errBox:(NSString*)msg {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"错误" message:msg
                        delegate:nil cancelButtonTitle:@"确 定"
                        otherButtonTitles:nil];
    [alert show];
}

// 是否问询框
+ (int)askBox:(NSString*)msg {
    BQAlertView* alert = [[BQAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"否" otherButtonTitles:@"是",nil];
    return [alert showModal];
}

// 自定义问询框
+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 {
    return [self askBoxWithButtons:msg withButton0:button0 withButton1:nil];
}

+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 withButton1:(NSString*)button1 {
    return [self askBoxWithButtons:msg withButton0:button0 withButton1:button1 withButton2:nil];
}

+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 withButton1:(NSString*)button1 withButton2:(NSString*)button2 {
    return [self askBoxWithButtons:msg withButton0:button0 withButton1:button1 withButton2:button2 withButton3:nil];
}

+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 withButton1:(NSString*)button1 withButton2:(NSString*)button2 withButton3:(NSString*)button3 {
    return [self askBoxWithButtons:msg withButton0:button0 withButton1:button1 withButton2:button2 withButton3:button3 withButton4:nil];
}

+ (int)askBoxWithButtons:(NSString*)msg withButton0:(NSString*)button0 withButton1:(NSString*)button1 withButton2:(NSString*)button2 withButton3:(NSString*)button3 withButton4:(NSString*)button4 {
    BQAlertView* alert = [[BQAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:button0 otherButtonTitles:button1, button2, button3, button4, nil];
    
    return [alert showModal];
}


@end
