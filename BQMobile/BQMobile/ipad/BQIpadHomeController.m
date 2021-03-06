//
//  BQContentViewController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//
#import "Color.h"
#import "BQIpadHomeController.h"
#import "BQIpadHomeController.h"
#import "NavigationBarButton.h"
#import "MSViewControllerSlidingPanel.h"
//
#import "BQIpadLeftSideMenuController.h"
#import "BQIpadSystemSettingController.h"
#import "BQIpadAnalysisTopicController.h"
#import "BQIpadFunctionController.h"
#import "BQIpadCommonPanelController.h"

@interface BQIpadHomeController ()<BQLeftMenuFunctionDelegate>
/**
 *  The left button of the navigation bar.
 */

@property (nonatomic, strong)   NavigationBarButton *sideMenuButton;
@property (nonatomic, strong)   NavigationBarButton *settingButton;
@end

@implementation BQIpadHomeController

- (void) loadView
{
    CGSize windowSize = [[UIScreen mainScreen] bounds].size;
    [self setView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, windowSize.width, windowSize.height)]];
    [[self view] setBackgroundColor:[UIColor centerBackgroundColor]];
    [self resetDefaultPanelValuesForSide:MSSPSideDisplayedLeft];

    // 侧边栏菜单按钮
    [self setSideMenuButton:[NavigationBarButton buttonWithType:NavigationBarButtonTypeMenu]];
    [[self sideMenuButton] setTarget:self];
    [[self sideMenuButton] setAction:@selector(openMenuPanel)];

    // 导航栏右侧设置按钮
    [self setSettingButton:[NavigationBarButton buttonWithType:NavigationBarButtonTypeMenu]];
    [[self settingButton] setTarget:self];
    [[self settingButton] setAction:@selector(openSettingPanel)];

    //
    self.navigationItem.title = @"BI 首页";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self sideMenuButton]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self settingButton]];
  
    
}

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

#pragma mark - switch page action implementation
- (void) openTopicNavigationPanel
{
    DLog(@"主题导航...");
    [self.navigationController pushViewController:[[BQIpadAnalysisTopicController alloc] init] animated:YES];
}

#pragma mark - action implementations
#pragma mark - navigation bar button click function implementation
- (void) openMenuPanel
{
    DLog(@"菜单...");
    if ([[self slidingPanelController] sideDisplayed] == MSSPSideDisplayedLeft) {
        [[self slidingPanelController] closePanel];
    } else {
        [[self slidingPanelController] openLeftPanel];
    }
}


#pragma mark - action implementations
#pragma mark - navigation bar button click function implementation
- (void) openSettingPanel
{
    DLog(@"设置...");
    [self.navigationController pushViewController:[[BQIpadSystemSettingController alloc] init] animated:YES];
}

#pragma mark - left side panel selected item event.
- (void) openPanelViewController:(BQEventSelectedMode) eventSelectedMode
{
    [self.navigationController popToRootViewControllerAnimated:NO];
    switch (eventSelectedMode) {
        case BQEventSelectedModeRecent:
            [self.navigationController pushViewController:[[BQIpadCommonPanelController alloc] init] animated:YES];
            break;
            
        case BQEventSelectedModeInBox:
            [self.navigationController pushViewController:[[BQIpadCommonPanelController alloc] init] animated:YES];

            break;
            
        case BQEventSelectedModeCollection:
            [self.navigationController pushViewController:[[BQIpadCommonPanelController alloc] init] animated:YES];

            break;
            
        default:
            break;
    }
}


@end
