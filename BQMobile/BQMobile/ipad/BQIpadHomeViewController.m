//
//  RootViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "BQIpadHomeViewController.h"
#import "BQLeftPanelViewController.h"
#import "BQNavigationViewController.h"
#import "LeftPanelViewModel.h"
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
    LeftPanelViewModel *leftPanelModel;
    BQLeftPanelViewController *leftPanelViewController;
    BQNavigationViewController *navigationViewController;
    
    leftPanelModel          = [[LeftPanelViewModel alloc] init];
    leftPanelViewController = [[BQLeftPanelViewController alloc] init];
    [leftPanelViewController setDelegate:leftPanelModel];
    [leftPanelViewController setHasStateBar:self.hasStateBar];

    
    navigationViewController = [[BQNavigationViewController alloc] initWithRootViewController:[[BQContentViewController alloc] init]];
    [navigationViewController setHasStateBar:self.hasStateBar];

    [self setLeftPanelController:leftPanelViewController];
    [self setCenterViewController:navigationViewController];
    [self setLeftPanelStatusBarColor:[UIColor menuStatusBarColor]];
    

}






@end
