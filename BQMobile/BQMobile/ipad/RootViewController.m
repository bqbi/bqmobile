//
//  RootViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "RootViewController.h"
#import "LeftPanelViewController.h"
#import "CenterPanelViewController.h"
#import "LeftPanelViewModel.h"
#import "Color.h"
<<<<<<< HEAD
#import "SettingPanelViewController.h"
=======
>>>>>>> FETCH_HEAD

@interface RootViewController ()

@end

@implementation RootViewController

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
    LeftPanelViewController *leftPanelViewController;
    CenterPanelViewController *centerPanelViewController;
    
    leftPanelModel          = [[LeftPanelViewModel alloc] init];
    leftPanelViewController = [[LeftPanelViewController alloc] init];
    [leftPanelViewController setDelegate:leftPanelModel];
<<<<<<< HEAD
    [leftPanelViewController setHasStateBar:self.hasStateBar];
    //
    
    centerPanelViewController = [[CenterPanelViewController alloc] init];
    [centerPanelViewController setHasStateBar:self.hasStateBar];
=======
    //
    
    centerPanelViewController = [[CenterPanelViewController alloc] init];
    
>>>>>>> FETCH_HEAD
    [self setLeftPanelController:leftPanelViewController];
    [self setCenterViewController:centerPanelViewController];
    [self setLeftPanelStatusBarColor:[UIColor menuStatusBarColor]];
    

}

<<<<<<< HEAD
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self openLeftPanel];
    
}

#pragma mark - navigation bar button click function implementation
- (void) openSettingPanel
{
    DLog(@"设置...");
    [self.navigationController pushViewController:[[SettingPanelViewController alloc] init] animated:YES];
}
=======
>>>>>>> FETCH_HEAD

@end
