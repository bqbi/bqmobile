//
//  BQIphoneFrameController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneFrameController.h"
#import "BQIphoneHomeController.h"
#import "BQTableViewDataSource.h"
#import "BQIphoneLeftSizeMenuController.h"


@interface BQIphoneFrameController ()

@end

@implementation BQIphoneFrameController

- (id) init
{
    self = [super init];
    if (self) {
        [self loadControllers];
    }
    return  self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self loadControllers];
    }
    return self;
}

/*
 * 加载侧边栏以及主导航控制器
 */
- (void) loadControllers
{
    BQIphoneLeftSideMenuModel             *leftPanelModel;
    BQTableViewDataSource               *bqDataSource;
    BQIphoneLeftSideMenuController        *leftPanelViewController;
    UINavigationController              *navigationViewController;
    
    // 创建主导航控制器
    BQIphoneHomeController *contentViewController = [[BQIphoneHomeController alloc] init];
    navigationViewController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    [self setCenterViewController:navigationViewController];
    [self setLeftPanelStatusBarColor:[UIColor whiteColor]];
    
    
    // 创建左部工具栏
    leftPanelModel = [[BQIpadLeftSideMenuModel alloc] initWithFuncDelegate:contentViewController];
    bqDataSource = [[BQTableViewDataSource alloc] initWithDataModel:nil andDelegate:leftPanelModel];
    leftPanelViewController = [[BQIpadLeftSideMenuController alloc] initWithDataSource:bqDataSource];
    leftPanelViewController.hasStateBar = self.hasStateBar;
    [self setLeftPanelController:leftPanelViewController];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


@end
