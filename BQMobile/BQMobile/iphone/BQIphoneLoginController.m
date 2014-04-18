//
//  BQIphoneLoginControllerViewController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneLoginController.h"
#import "BQCore.h"
#import "BQIphoneSystemSettingController.h"
#import "BQIphoneFrameController.h"
#import "BQIphoneServerSettingController.h"
#import "BQResource.h"

@interface BQIphoneLoginController ()

@end

@implementation BQIphoneLoginController

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
    [super loadView];
    // 导航栏设置
    self.navigationItem.title = @"用户登录";
    // 设置按钮
    UIImage * settingColdImage = [BQResource sharedManager].navibarSettingButtonColdImage;
    UIImage * settingHotImage  = [BQResource sharedManager].navibarSettingButtonHotImage;
    
    UIButton * settingButton = [[UIButton alloc] init];
    [settingButton setBackgroundImage:settingColdImage forState:UIControlStateNormal];
    [settingButton setBackgroundImage:settingHotImage forState:UIControlStateHighlighted];
    settingButton.frame = CGRectMake(-10, 0, settingColdImage.size.width, settingColdImage.size.height);
    [settingButton addTarget:self action:@selector(onIphonePressedSetting) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
    
    // 加载登陆页面
    loginView = [[BQIphoneLoginView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [self.view addSubview:loginView];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    // 1.隐藏导航栏
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
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
    // 检验用户名密码等登录信息是否有效
    [self.navigationController pushViewController:[[BQIphoneFrameController alloc ]init] animated:YES];
    
}


#pragma
#pragma mark BQIpadLoginViewDelegate
- (void)onIphonePressedButton:(NSInteger)index {
    
    switch (index) {
        case 1:
            DLog(@"登录......");
            [BQContext sharedContext].autoLogin = @"NO";
            
            [self doLogin];
            break;
            
        case 2:
            DLog(@"设置自动登录......");
            [BQContext sharedContext].autoLogin = @"YES";

            break;
            
        default:
            break;
    }
    
}

- (void) onIphonePressedSetting
{
    [self.navigationController pushViewController:[[BQIphoneServerSettingController alloc] init] animated:YES];
}

- (void)onIphoneEditingDidBeginTextField:(NSInteger)index {
    DLog(@"begin :%d",index);
}

- (void)onIphoneEditingDidEndTextField:(NSInteger)index {
    DLog(@"end :%d",index);
    
}

@end
