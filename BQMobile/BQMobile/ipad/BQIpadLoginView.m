//
//  BQIpadLoginView.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIpadLoginView.h"

#import "BQCore.h"

#import "BQResource.h"


// ipad字号大小
#define Ipad_TextFont [UIFont systemFontOfSize:16.0f]

@implementation BQIpadLoginView

@synthesize backImageView;
@synthesize userName;
@synthesize password;
@synthesize serverUrl;

@synthesize loginButton;
@synthesize offlineButton;
@synthesize quitButton;
@synthesize rememberCheckBox;

@synthesize userLogoImage;
@synthesize passwordLogoImage;
@synthesize serverUrlLogoImage;

@synthesize delegate;


// 加载页面元素
- (void)loadRootView {
    DLog(@"加载登录页面元素")
    
    // 清空界面
    for (UIView* view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    // 添加背景
    backImageView = [[UIImageView alloc] init];
    [self addSubview:backImageView];
    
    // 用户名
    userName = [[UITextField alloc] init];
    userName.backgroundColor = [UIColor clearColor];
    userName.font = Ipad_TextFont;
    userName.placeholder = @"请输入用户名";
    userName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userName.textColor = [UIColor blackColor];
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [userName addTarget:self action:@selector(OnEditingDidBeginTextField:) forControlEvents:UIControlEventEditingDidBegin];
    [userName addTarget:self action:@selector(OnEditingDidEndTextField:) forControlEvents:UIControlEventEditingDidEnd];
    
    [self addSubview:userName];
    
    // 密码
    password = [[UITextField alloc] init];
    password.backgroundColor = [UIColor clearColor];
    password.font = Ipad_TextFont;
    password.placeholder = @"请输入密码";
    password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    password.textColor = [UIColor blackColor];
    password.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:password];
    
    // 服务地址
    serverUrl = [[UITextField alloc] init];
    serverUrl.backgroundColor = [UIColor clearColor];
    serverUrl.font = Ipad_TextFont;
    serverUrl.placeholder = @"请输入服务地址";
    serverUrl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    serverUrl.textColor = [UIColor blackColor];
    serverUrl.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self addSubview:serverUrl];
    
    UIImage* loginBtnImg = [[BQResource sharedManager] imageFromResource:@"Pad_Login_button.png"];
    UIImage* offlineBtnImg = [[BQResource sharedManager] imageFromResource:@"Pad_Offline_button.png"];
    UIImage* logoutBtnImg = [[BQResource sharedManager] imageFromResource:@"Pad_Logout_button.png"];
    UIImage* unselectCheckBoxImg = [[BQResource sharedManager] imageFromResource:@"Pad_checkBox_unselect.png"];
    UIImage* selectCheckBoxImg = [[BQResource sharedManager] imageFromResource:@"Pad_checkBox_select.png"];
    
    
    // 登录
    loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton addTarget:self action:@selector(OnClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setBackgroundImage:loginBtnImg forState:UIControlStateNormal];
    loginButton.tag = 1;
    [self addSubview:loginButton];
    
    // 离线浏览
    offlineButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [offlineButton addTarget:self action:@selector(OnClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [offlineButton setBackgroundImage:offlineBtnImg forState:UIControlStateNormal];
    offlineButton.tag = 2;
    [self addSubview:offlineButton];
    
    // 退出
    quitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [quitButton addTarget:self action:@selector(OnClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [quitButton setBackgroundImage:logoutBtnImg forState:UIControlStateNormal];
    quitButton.tag = 3;
    [self addSubview:quitButton];
    
    // 记住密码
    rememberCheckBox = [UIButton buttonWithType:UIButtonTypeCustom];
    [rememberCheckBox addTarget:self action:@selector(OnClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [rememberCheckBox setBackgroundImage:unselectCheckBoxImg forState:UIControlStateNormal];
    [rememberCheckBox setBackgroundImage:selectCheckBoxImg forState:UIControlStateSelected];
    rememberCheckBox.tag = 4;
    [self addSubview:rememberCheckBox];
    
}

- (void)OnEditingDidBeginTextField:(UITextField*)tf {
    if (delegate != nil && [delegate respondsToSelector:@selector(onIpadEditingDidBeginTextField:)]) {
        [delegate onIpadEditingDidBeginTextField:tf.tag];
    }
}

- (void)OnEditingDidEndTextField:(UITextField*)tf {
    if (delegate != nil && [delegate respondsToSelector:@selector(onIpadEditingDidEndTextField:)]) {
        [delegate onIpadEditingDidEndTextField:tf.tag];
    }
}

- (void)OnClickButton:(UIButton*)button {
    if (delegate != nil && [delegate respondsToSelector:@selector(onIpadPressedButton:)]) {
        [delegate onIpadPressedButton:button.tag];
    }
}

// 调整组件位置-纵向
- (void)adjustPositionWithPortrait {

    backImageView.image = [[BQResource sharedManager] imageFromResource:@"Pad_Login_portrait.png"];
    backImageView.frame = CGRectMake(0, 0, 768, 1024);
    
    userName.frame = CGRectMake(239, 337, 420, 41);
    password.frame = CGRectMake(239, 417, 420, 41);
    serverUrl.frame = CGRectMake(239, 497, 420, 41);
    
    loginButton.frame = CGRectMake(229, 596, 134, 59);
    offlineButton.frame = CGRectMake(229+134+17, 596, 134, 59);
    quitButton.frame = CGRectMake(229+(134+17)*2, 596, 134, 59);
    rememberCheckBox.frame = CGRectMake(237, 563, 15, 17);
    
}

// 调整组件位置-横向
- (void)adjustPositionWithLandscape {
    
    backImageView.image = [[BQResource sharedManager] imageFromResource:@"Pad_Login_landscape.png"];
    backImageView.frame = CGRectMake(0, 0, 1024, 768);
    
    userName.frame = CGRectMake(370, 256, 420, 41);
    password.frame = CGRectMake(370, 337, 420, 41);
    serverUrl.frame = CGRectMake(370, 417, 420, 41);
    
    loginButton.frame = CGRectMake(359, 521, 134, 59);
    offlineButton.frame = CGRectMake(359+134+18, 521, 134, 59);
    quitButton.frame = CGRectMake(359+(134+18)*2, 521, 134, 59);
    rememberCheckBox.frame = CGRectMake(367, 483, 15, 17);
    
}


@end
