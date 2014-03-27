//
//  BQIpadLoginController.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIpadLoginController.h"
#import "Common.h"
#import "RootViewController.h"

@implementation BQIpadLoginController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    loginView = [[BQIpadLoginView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
    [self.view addSubview:loginView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    // 1.隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 2.设置view的代理
    loginView.delegate = self;
    
    // 3.加载页面元素
    [loginView loadLoginView];
    
    // 4.设置样式
    NSString* style = [BQContext getGlobalStyle];
    [loginView setStyle:style];
    
    // 5.调整位置
    [self adjustPosition];
    
}

- (void)adjustPosition {
    DLog(@"显示页面方向为%@",(UIInterfaceOrientationIsPortrait(self.interfaceOrientation))?@"竖屏":@"横屏");
    orientation = self.interfaceOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        [loginView adjustPositionWithPortrait];
    } else {
        [loginView adjustPositionWithLandscape];
    }
}

- (BOOL)shouldAutorotate {
    if (orientation != self.interfaceOrientation) {
        [self adjustPosition];
    }
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void)doLogin {
    // 检验用户名密码等登录信息是否有效
    [self.navigationController pushViewController:[[RootViewController alloc ]init] animated:YES];
    
}


#pragma
#pragma mark BQIpadLoginViewDelegate
- (void)onIpadPressedButton:(NSInteger)index {

    switch (index) {
        case 1:
            DLog(@"登录......");
            [BQContext sharedContext].autoLogin = @"NO";
            [self doLogin];
            break;
            
        case 2:
            DLog(@"离线浏览......");

            break;
            
        case 3:
            DLog(@"退出......");
            [FSUtils clearTempDirectory];
            exit(0);
            break;
            
        case 4:
            DLog(@"记住密码......");
            loginView.rememberCheckBox.selected = !loginView.rememberCheckBox.selected;
            break;
            
        default:
            break;
    }
    
}

- (void)onIpadEditingDidBeginTextField:(NSInteger)index {
    DLog(@"begin :%d",index);
    }

- (void)onIpadEditingDidEndTextField:(NSInteger)index {
    DLog(@"end :%d",index);
    
}

@end
