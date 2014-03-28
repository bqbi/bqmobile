//
//  RootViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "BQIpadHomeViewController.h"
#import "BQLeftPanelViewController.h"
#import "BQMainPanelViewController.h"
#import "LeftPanelViewModel.h"
#import "Color.h"
#import "SettingPanelViewController.h"


@interface BQIpadHomeViewController ()

@end

@implementation BQIpadHomeViewController

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

- (void) loadControllers
{
    LeftPanelViewModel *leftPanelModel;
    BQLeftPanelViewController *leftPanelViewController;
    BQMainPanelViewController *centerPanelViewController;
    
    leftPanelModel          = [[LeftPanelViewModel alloc] init];
    leftPanelViewController = [[BQLeftPanelViewController alloc] init];
    [leftPanelViewController setDelegate:leftPanelModel];

    
    centerPanelViewController = [[BQMainPanelViewController alloc] init];
    [centerPanelViewController setHasStateBar:self.hasStateBar];

    [self setLeftPanelController:leftPanelViewController];
    [self setCenterViewController:centerPanelViewController];
    [self setLeftPanelStatusBarColor:[UIColor menuStatusBarColor]];
    

}



#pragma mark - navigation bar button click function implementation
- (void) openSettingPanel
{
    DLog(@"设置...");
    [self.navigationController pushViewController:[[SettingPanelViewController alloc] init] animated:YES];
}


@end
