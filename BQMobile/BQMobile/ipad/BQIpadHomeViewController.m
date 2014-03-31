//
//  RootViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "BQIpadHomeViewController.h"
#import "BQLeftSidePanelViewController.h"
#import "BQNavigationViewController.h"
#import "BQLeftSidePanelViewModel.h"
#import "Color.h"
#import "BQContentViewController.h"

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
    BQLeftSidePanelViewModel *leftPanelModel;
    BQLeftSidePanelViewController *leftPanelViewController;
    BQNavigationViewController *navigationViewController;
    
    leftPanelModel          = [[BQLeftSidePanelViewModel alloc] init];
    leftPanelViewController = [[BQLeftSidePanelViewController alloc] init];
    [leftPanelViewController setDelegate:leftPanelModel];
    [leftPanelViewController setHasStateBar:self.hasStateBar];

    //
    BQContentViewController *contentViewController = [[BQContentViewController alloc] init];
    [leftPanelModel setDelegate:contentViewController];
    
    navigationViewController = [[BQNavigationViewController alloc] initWithRootViewController:contentViewController];
    [navigationViewController setHasStateBar:self.hasStateBar];

    [self setLeftPanelController:leftPanelViewController];
    [self setCenterViewController:navigationViewController];
    [self setLeftPanelStatusBarColor:[UIColor menuStatusBarColor]];
    

}






@end
