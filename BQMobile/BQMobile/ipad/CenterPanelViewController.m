//
//  CenterPanelViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "CenterPanelViewController.h"
#import "NavigationBarButton.h"
#import "MSViewControllerSlidingPanel.h"
#import "Color.h"
#import "LeftPanelViewController.h"

@interface CenterPanelViewController ()


#pragma mark Menu buttons
/** @name Menu buttons */

/**
 *  The left button of the navigation bar.
 */
@property (nonatomic, strong)   NavigationBarButton *sideMenuButton;
@property (nonatomic, strong)   NavigationBarButton *settingButton;

@end

@implementation CenterPanelViewController

- (void) loadView
{
    CGSize windowSize = [[UIScreen mainScreen] bounds].size;
    [self setView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, windowSize.width, windowSize.height)]];
    [[self view] setBackgroundColor:[UIColor centerBackgroundColor]];
    //
    [self resetDefaultPanelValuesForSide:MSSPSideDisplayedLeft];
    // 侧边栏菜单按钮
    [self setSideMenuButton:[NavigationBarButton buttonWithType:NavigationBarButtonTypeMenu]];
    [[self sideMenuButton] setTarget:[self slidingPanelController]];
    
    if ([[self slidingPanelController] sideDisplayed] == MSSPSideDisplayedLeft)
        [[self sideMenuButton] setAction:@selector(closePanel)];
    else
        [[self sideMenuButton] setAction:@selector(openLeftPanel)];
    
    // 导航栏右侧设置按钮
    [self setSettingButton:[NavigationBarButton buttonWithType:NavigationBarButtonTypeMenu]];
    [[self settingButton] setTarget:[self slidingPanelController]];
    [[self settingButton] setAction:@selector(openSettingPanel)];
    
    //
    UINavigationItem *navigationBarItem = [[UINavigationItem alloc] initWithTitle:@"BI 首页"];
    [navigationBarItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:[self sideMenuButton]]];
    [navigationBarItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:[self settingButton]]];
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, _hasStateBar? 20:0, windowSize.width, 44)];
    if ([navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
        [navigationBar setBarTintColor:[UIColor brownColor]];
    }
    else{
        [navigationBar setTintColor:[UIColor brownColor]];
    }
    [navigationBar pushNavigationItem:navigationBarItem animated:NO];
    [navigationBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    // 增加其他导航栏按钮
    
    [[self view] addSubview:navigationBar];
}


#pragma mark MSSlidingPanelControllerDelegate protocol
/** @name MSSlidingPanelControllerDelegate protocol */

/**
 *  Tells the delegate that the specified side begins to bring out.
 *
 *  @param panelController The panel controller.
 *  @param side            The side.
 */
- (void)slidingPanelController:(MSSlidingPanelController *)panelController beginsToBringOutSide:(MSSPSideDisplayed)side
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

/**
 *  Tells the delegate that the specified side has been opened.
 *
 *  @param panelController The panel controller.
 *  @param side            The side.
 */
- (void)slidingPanelController:(MSSlidingPanelController *)panelController hasOpenedSide:(MSSPSideDisplayed)side
{
    if (side == MSSPSideDisplayedLeft)
        [[self sideMenuButton] setAction:@selector(closePanel)];
}


#pragma mark Tool - adjust the panel of left with width
/** @name Tool */

/**
 *  Reset the default panel values.
 *
 *  @param side The side on which the values must be applied.
 */
- (void)resetDefaultPanelValuesForSide:(MSSPSideDisplayed)side
{
    if (side == MSSPSideDisplayedLeft)
    {
        [[self slidingPanelController] setLeftPanelMaximumWidth:260];
        [[self slidingPanelController] setLeftPanelOpenGestureMode:MSSPOpenGestureModeAll];
        [[self slidingPanelController] setLeftPanelCloseGestureMode:MSSPCloseGestureModeAll];
        [[self slidingPanelController] setLeftPanelCenterViewInteractionMode:MSSPCenterViewInteractionNavBar];
    }
    else
    {
        [[self slidingPanelController] setLeftPanelStatusBarDisplayedSmoothly:NO];
        [[self slidingPanelController] setRightPanelStatusBarDisplayedSmoothly:NO];
    }
}

@end
