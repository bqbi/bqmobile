//
//  BQLoginView.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQView.h"
#import "BQButtonSwitch.h"
//#import "BQImageTextView.h"

// iPad登录视图的代理协议
@protocol BQIphoneLoginViewDelegate <NSObject>

- (void)onIphonePressedButton:(NSInteger)index;

- (void)onIphoneEditingDidBeginTextField:(NSInteger)index;

- (void)onIphoneEditingDidEndTextField:(NSInteger)index;

@end


@interface BQIphoneLoginView : BQView

@property(nonatomic, retain) UIImageView* userImage;    // 用户图片
@property(nonatomic, retain) UITextField* userName; // 用户名
@property(nonatomic, retain) UIImageView* passwordImage;// 密码图片
@property(nonatomic, retain) UITextField* password; // 密码


@property(nonatomic, retain) UIButton* loginButton; // 登录按钮

@property(nonatomic,retain)  UILabel* rememberLabel;
@property(nonatomic, retain) BQButtonSwitch* rememberCheckBox; // 记住密码


@property(nonatomic, assign) NSObject<BQIphoneLoginViewDelegate>* delegate;// 代理方法

@end
