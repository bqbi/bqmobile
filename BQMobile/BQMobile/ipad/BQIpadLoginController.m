//
//  BQIpadLoginController.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIpadLoginController.h"
#import "Common.h"

#import "BQCommonUI.h"

@implementation BQIpadLoginController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    loginView = [[BQIpadLoginView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:loginView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    // 1.隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 2.设置view的代理
    loginView.delegate = self;
    
    // 3.加载页面元素
    [loginView loadRootView];
    
    // 4.调整位置
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
//    int aa = [BQCommonUI askBoxWithButtons:@"地方多舒服舒服舒服" withButton0:@"取消" withButton1:@"按钮1" withButton2:@"按钮2" withButton3:@"按钮3"];
//    DLog(@"--------%d", aa);
    [BQCommonUI showLoadView];
    
    NSRunLoop* curRunLoop = [NSRunLoop currentRunLoop];
    int index = 5;
    while ([curRunLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]] && index > 0) {
        index--;
        DLog(@"---------index----%d", index);
    }
    
    
    [BQCommonUI hideLoadView];
    
    
    return;
}


#pragma
#pragma mark BQIpadLoginViewDelegate
- (void)onIpadPressedButton:(NSInteger)index {

    switch (index) {
        case 1:
            DLog(@"登录......");
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
