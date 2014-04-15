//
//  BQServerSettingController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneServerSettingController.h"
#import "BQIphoneServerSettingView.h"
#import "BQMobileResource.h"

@interface BQIphoneServerSettingController ()

@end

@implementation BQIphoneServerSettingController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) loadView
{
    // 自定义导航按钮
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    backButton.frame = CGRectMake(4, 4, 32, 32);
//    
//    [backButton setBackgroundImage:[BQMobileResource sharedManager].navibarBackButtonColdImage
//                          forState:UIControlStateNormal];
//    [backButton setBackgroundImage:[BQMobileResource sharedManager].navibarBackButtonHotImage
//                          forState:UIControlStateSelected];
//    
//    
//    [backButton addTarget:self action:@selector(onBackClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    self.navigationItem.leftBarButtonItem   = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    // 创建内容视图
    BQIphoneServerSettingView * contentView = [[BQIphoneServerSettingView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    // 设置代理
    [contentView setDelegate:self];
    // 加载
    [contentView loadRootView];
    self.view = contentView;
    // 布局
    [contentView adjustPositionWithPortrait];
}

- (void) onButtonClick:(id)sender
{
    BQIphoneServerSettingView * contentView = (BQIphoneServerSettingView*)sender;
    NSString * serverAddress = contentView.server.text;
    NSInteger  nPort         = [contentView.port.text intValue];
    
    NSLog(@"保存服务器设置，地址：%@, 端口：%d", serverAddress, nPort);
}

- (void) onBackClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
