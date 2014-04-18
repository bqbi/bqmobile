//
//  BQLoginView.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneLoginView.h"
#import "BQCore.h"
#import "BQResource.h"


// ipad字号大小
#define Iphone_TextFont [UIFont systemFontOfSize:14.0f]


@implementation BQIphoneLoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// 加载页面元素
- (void)loadRootView {
    DLog(@"加载登录页面元素")
    
    // 清空界面
    for (UIView* view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    // 添加背景
    UIImageView * bkImageView = [[UIImageView alloc]initWithImage:[BQResource sharedManager].loginBackgroundImage];
    [self addSubview:bkImageView];
    // 用户图片
    _userImage = [[UIImageView alloc] initWithImage:[BQResource sharedManager].loginUserImage];
    [self addSubview:_userImage];
    // 用户名
    _userName = [[UITextField alloc] init];
    _userName.font = Iphone_TextFont;
    _userName.placeholder = @"请输入用户名";
    _userName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _userName.textColor = [UIColor blackColor];
    _userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    _userName.borderStyle = UITextBorderStyleNone;
    //
    [self addSubview:_userName];
    
    // 用户图片
    _passwordImage = [[UIImageView alloc] initWithImage:[BQResource sharedManager].loginPasswordImage];
    [self addSubview:_passwordImage];
    // 密码
    _password = [[UITextField alloc] init];
//    _password.backgroundColor = [UIColor colorWithPatternImage:[BQMobileResource sharedManager].loginPasswordImage];
    _password.font = Iphone_TextFont;
    _password.placeholder = @"请输入密码";
    _password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _password.textColor = [UIColor blackColor];
    _password.clearButtonMode = UITextFieldViewModeWhileEditing;
    _password.borderStyle = UITextBorderStyleNone;
    [self addSubview:_password];
    
    
    // 登录
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginButton setImage:[BQResource sharedManager].loginButtonColdImage forState:UIControlStateNormal];
    [_loginButton setImage:[BQResource sharedManager].loginButtonHotImage forState:UIControlStateHighlighted];
    [_loginButton addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    _loginButton.tag = 1;
    [self addSubview:_loginButton];
    
    // 自动登录标签
    _rememberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 64, 40)];
    _rememberLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    _rememberLabel.text = @"自动登录";
    _rememberLabel.textAlignment = UITextAlignmentRight;
    _rememberLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_rememberLabel];
    
    // 记住密码
    _rememberCheckBox = [[BQButtonSwitch alloc] initWithFrame:CGRectMake(0, 0, 46, 28) didChangeHandler:^(BOOL isOn){[self onClickButton:_rememberCheckBox];}];
    _rememberCheckBox.tag = 2;
    [self addSubview:_rememberCheckBox];
    
}


- (void) onClickButton:(UIControl*)button
{
    [self.delegate onIphonePressedButton:button.tag];
}


// 调整组件位置-纵向
- (void)adjustPositionWithPortrait {
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    int nPos = Layout_SpltLineWidth_12 + 44;
    _userImage.frame = CGRectMake(Layout_LeftOffset, nPos, rect.size.width-Layout_LeftOffset-Layout_RightOffset, Layout_Control_Height);
    _userName.frame = CGRectMake(Layout_LeftOffset+Layout_Control_Height+Layout_SpltLineWidth_2, nPos+8, rect.size.width-Layout_LeftOffset-Layout_RightOffset, Layout_Control_Height);
    
    nPos += Layout_Control_Height + Layout_SpltLineWidth_2;
    _passwordImage.frame = CGRectMake(Layout_LeftOffset, nPos, rect.size.width-Layout_LeftOffset-Layout_RightOffset, Layout_Control_Height);
    _password.frame = CGRectMake(Layout_LeftOffset+Layout_SpltLineWidth_2+Layout_Control_Height, nPos+8, rect.size.width-Layout_LeftOffset-Layout_RightOffset, Layout_Control_Height);
    
    nPos += Layout_Control_Height + Layout_SpltLineWidth_12;
    _rememberLabel.frame = CGRectMake(rect.size.width-Layout_RightOffset-46 - 70, nPos-4, 64, 38);
    _rememberCheckBox.frame = CGRectMake(rect.size.width-Layout_RightOffset-46, nPos, 46, 28);
    
    nPos += 28 + Layout_SpltLineWidth_12;
    _loginButton.frame = CGRectMake(Layout_LeftOffset, nPos, rect.size.width-Layout_LeftOffset-Layout_RightOffset, 44);
}

// 调整组件位置-横向
- (void)adjustPositionWithLandscape {
    

    
}


@end
