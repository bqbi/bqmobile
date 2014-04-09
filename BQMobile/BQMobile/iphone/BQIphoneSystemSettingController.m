//
//  BQIphoneSystemSettingController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneSystemSettingController.h"
#import "BQIphoneSystemSettingDataSource.h"

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
    
    // 1.创建View
    _settingView = [[BQIphoneSystemSettingView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] andDatasource:[[BQIphoneSystemSettingDataSource alloc] init] andTableViewDelegate:nil];
    
    // 2.加载页面元素
    [_settingView loadRootView];
    
    //3.加入到当前视图
    [self.view addSubview:_settingView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

- (void)adjustPosition {
    DLog(@"显示页面方向为%@",(UIInterfaceOrientationIsPortrait(self.interfaceOrientation))?@"竖屏":@"横屏");
}


- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
