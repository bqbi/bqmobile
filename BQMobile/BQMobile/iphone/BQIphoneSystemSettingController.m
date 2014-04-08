//
//  BQIphoneSystemSettingController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneSystemSettingController.h"

@interface BQIphoneSystemSettingController ()

@end

@implementation BQIphoneSystemSettingController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// 定义导航栏信息
    self.navigationItem.title = @"设置";
    
    // 创建View
    _settingView = [[BQIphoneSystemSettingView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [self.view addSubview:_settingView];
}

- (void)viewWillAppear:(BOOL)animated {
    
    // 1.设置view的代理
//    settingView.delegate = self;
    
    // 2.加载页面元素
    [_settingView loadRootView];
    
    // 3.调整位置
    [self adjustPosition];
    
}

- (void)adjustPosition {
    DLog(@"显示页面方向为%@",(UIInterfaceOrientationIsPortrait(self.interfaceOrientation))?@"竖屏":@"横屏");
//    orientation = self.interfaceOrientation;
//    if (UIInterfaceOrientationIsPortrait(orientation)) {
//        [settingView adjustPositionWithPortrait];
//    } else {
//        [settingView adjustPositionWithLandscape];
//    }
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

@end
