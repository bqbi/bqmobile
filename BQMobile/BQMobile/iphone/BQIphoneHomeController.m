//
//  BQIphoneHomeController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneHomeController.h"
// 与侧边栏功能实现相关类文件
#import "NavigationBarButton.h"
#import "MSViewControllerSlidingPanel.h"
//
#import "BQResource.h"

@interface BQIphoneHomeController ()
/**
 *  The left button of the navigation bar.
 */

@property (nonatomic, strong)   UIButton *sideMenuButton;

@end


@implementation BQIphoneHomeController

- (void) loadView
{
    CGSize windowSize = [[UIScreen mainScreen] bounds].size;
    [self setView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, windowSize.width, windowSize.height)]];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [self resetDefaultPanelValuesForSide:MSSPSideDisplayedLeft];
    
    // 侧边栏菜单按钮
    _sideMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sideMenuButton.frame = CGRectMake(8, 0, 40, 40);
    [_sideMenuButton setBackgroundImage:[BQResource sharedManager].navibarMenuButtonColdImage forState:UIControlStateNormal];
    [_sideMenuButton setBackgroundImage:[BQResource sharedManager].navibarMenuButtonHotImage forState:UIControlStateHighlighted];
    [_sideMenuButton addTarget:self action:@selector(openMenuPanel) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_sideMenuButton];
    // 工具条
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIButton * faverateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    faverateButton.frame = CGRectMake(0, 0, [BQResource sharedManager].toolbarFaverateColdImage.size.width, [BQResource sharedManager].toolbarFaverateColdImage.size.height);
    [faverateButton setBackgroundImage:[BQResource sharedManager].toolbarFaverateColdImage forState:UIControlStateNormal];
    [faverateButton setBackgroundImage:[BQResource sharedManager].toolbarFaverateHotImage forState:UIControlStateHighlighted];

    [faverateButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    self.toolbarItems = @[
                          flexItem,
                          [[UIBarButtonItem alloc] initWithCustomView:faverateButton],
                          flexItem,
                          [[UIBarButtonItem alloc] initWithCustomView:faverateButton],
                          flexItem,
                          [[UIBarButtonItem alloc] initWithCustomView:faverateButton],
                          flexItem,
                          [[UIBarButtonItem alloc] initWithCustomView:faverateButton],
                          flexItem];
    
    [self.navigationController  setToolbarHidden:NO animated:YES];
    [self.navigationController.toolbar setTranslucent:YES];
    [self.navigationController.toolbar setBackgroundImage:[BQResource sharedManager].toolbarBackgroundImage forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
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
    {
        [_sideMenuButton addTarget:self action:@selector(closePanel) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void)resetDefaultPanelValuesForSide:(MSSPSideDisplayed)side
{
    if (side == MSSPSideDisplayedLeft)
    {
        [[self slidingPanelController] setLeftPanelMaximumWidth:200];
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
//    [self.navigationController pushViewController:[[BQIpadAnalysisTopicController alloc] init] animated:YES];
}

#pragma mark - action implementations
#pragma mark - navigation bar button click function implementation
- (void) openMenuPanel
{
    if ([[self slidingPanelController] sideDisplayed] == MSSPSideDisplayedLeft) {
        [[self slidingPanelController] closePanel];
    } else {
        [[self slidingPanelController] openLeftPanel];
    }
}


#pragma mark - action implementations
#pragma mark - navigation bar button click function implementation
- (void) onDeleteContent
{
    DLog(@"设置...");
//    [self.navigationController pushViewController:[[BQIpadSystemSettingController alloc] init] animated:YES];
}

#pragma mark - left side panel selected item event.
- (void) openPanelViewController:(BQEventSelectedMode) eventSelectedMode
{
    [self.navigationController popToRootViewControllerAnimated:NO];
/*    switch (eventSelectedMode) {
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
 */
}

@end
