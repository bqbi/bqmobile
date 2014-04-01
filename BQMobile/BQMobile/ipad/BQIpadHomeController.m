//
//  RootViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "BQIpadHomeController.h"
#import "BQIpadNaviLeftSidePanelController.h"
#import "BQIpadLeftSidePanelModel.h"
#import "Color.h"
#import "BQIpadHomeContentController.h"

@interface BQIpadHomeController ()

@end

@implementation BQIpadHomeController

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
    BQIpadLeftSidePanelModel            *leftPanelModel;
    BQIpadNaviLeftSidePanelController   *leftPanelViewController;
    UINavigationController              *navigationViewController;
    
    leftPanelModel          = [[BQIpadLeftSidePanelModel alloc] init];
    leftPanelViewController = [[BQIpadNaviLeftSidePanelController alloc] init];
    [leftPanelViewController setDelegate:leftPanelModel];
    [leftPanelViewController setHasStateBar:self.hasStateBar];

    //
    BQIpadHomeContentController *contentViewController = [[BQIpadHomeContentController alloc] init];
    [leftPanelModel setDelegate:contentViewController];
    
    navigationViewController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    [self setLeftPanelController:leftPanelViewController];
    [self setCenterViewController:navigationViewController];
    [self setLeftPanelStatusBarColor:[UIColor menuStatusBarColor]];
    

}






@end
