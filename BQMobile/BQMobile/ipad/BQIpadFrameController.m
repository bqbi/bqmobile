//
//  RootViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "Color.h"
#import "BQIpadFrameController.h"
#import "BQIpadLeftSideMenuController.h"
#import "BQIpadLeftSideMenuModel.h"
#import "BQTableViewDataSource.h"
#import "BQIpadHomeController.h"

@interface BQIpadFrameController ()

@end

@implementation BQIpadFrameController

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
    BQIpadLeftSideMenuModel             *leftPanelModel;
    BQTableViewDataSource               *bqDataSource;
    BQIpadLeftSideMenuController        *leftPanelViewController;
    UINavigationController              *navigationViewController;
    
    
    //
    BQIpadHomeController *contentViewController = [[BQIpadHomeController alloc] init];
    //
    leftPanelModel = [[BQIpadLeftSideMenuModel alloc] initWithFuncDelegate:contentViewController];

    
    //
    bqDataSource            = [[BQTableViewDataSource alloc] initWithDataModel:nil andDelegate:leftPanelModel];
    leftPanelViewController = [[BQIpadLeftSideMenuController alloc] initWithDataSource:bqDataSource];
    leftPanelViewController.hasStateBar = self.hasStateBar;
    
    //
    navigationViewController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    [self setLeftPanelController:leftPanelViewController];
    [self setCenterViewController:navigationViewController];
    [self setLeftPanelStatusBarColor:[UIColor menuStatusBarColor]];
    

}






@end
