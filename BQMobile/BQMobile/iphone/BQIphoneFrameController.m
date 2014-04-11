//
//  BQIphoneFrameController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneFrameController.h"
#import "BQIphoneHomeController.h"
#import "BQTableViewDataModel.h"
#import "BQIphoneLeftSizeMenuController.h"
#import "BQIphoneMenuDataSource.h"
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
    BQTableViewDataModel               *bqDataSource;
    BQIphoneLeftSizeMenuController        *menuController;
    UINavigationController              *navigationViewController;
    
    // 创建主导航控制器
    BQIphoneHomeController *contentViewController = [[BQIphoneHomeController alloc] init];
    navigationViewController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    [self setCenterViewController:navigationViewController];
    [self setLeftPanelStatusBarColor:[UIColor whiteColor]];
    
    
    // 创建左部工具栏
    // 通过一个数据源解析和数据源，来构建出侧边栏目录数据模型对象
    bqDataSource = [[BQTableViewDataModel alloc] initWithDataModel:nil andDelegate:[[BQIphoneMenuDataSource alloc] initWithFuncDelegate:contentViewController]];
    menuController = [[BQIphoneLeftSizeMenuController alloc] initWithDataSource:bqDataSource];
    menuController.hasStateBar = self.hasStateBar;
    [self setLeftPanelController:menuController];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


@end
