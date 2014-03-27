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
    //
    
    centerPanelViewController = [[CenterPanelViewController alloc] init];
    
    [self setLeftPanelController:leftPanelViewController];
    [self setCenterViewController:centerPanelViewController];
    [self setLeftPanelStatusBarColor:[UIColor menuStatusBarColor]];
    

}


@end
