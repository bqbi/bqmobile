//
//  BQIpadLoginView.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BQCore.h"

// iPad登录视图的代理协议
@protocol BQIpadLoginViewDelegate <NSObject>

- (void)onIpadPressedButton:(NSInteger)index;

- (void)onIpadEditingDidBeginTextField:(NSInteger)index;

- (void)onIpadEditingDidEndTextField:(NSInteger)index;

@end

@interface BQIpadLoginView : UIView

@property(nonatomic, retain) UIImageView* backImageView; // 背景

@property(nonatomic, retain) UITextField* userName; // 用户名
@property(nonatomic, retain) UITextField* password; // 密码

@property(nonatomic, retain) UITextField* serverUrl; // 服务器地址

@property(nonatomic, retain) UIButton* loginButton; // 登录按钮
@property(nonatomic, retain) UIButton* offlineButton; // 离线按钮
@property(nonatomic, retain) UIButton* quitButton; // 退出按钮
@property(nonatomic, retain) UIButton* rememberCheckBox; // 记住密码

@property(nonatomic, retain) UIImageView* userLogoImage; // 用户名图片
@property(nonatomic, retain) UIImageView* passwordLogoImage; // 密码图片
@property(nonatomic, retain) UIImageView* serverUrlLogoImage; // 服务器地址图片

@property(nonatomic, assign) NSObject<BQIpadLoginViewDelegate>* delegate;// 代理方法

// 设置主题样式
- (void)setStyle:(NSString*)_style;

// 调整组件位置-纵向
- (void)adjustPositionWithPortrait;

// 调整组件位置-横向
- (void)adjustPositionWithLandscape;

@end
