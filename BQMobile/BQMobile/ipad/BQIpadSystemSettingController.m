//
//  SettingPanelViewController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//
#import "Color.h"
#import "BQIpadSystemSettingController.h"
#import "BQIpadSystemSettingView.h"

@interface BQIpadSystemSettingController ()

@end

@implementation BQIpadSystemSettingController



- (void) loadView
{
    self.view = [[BQIpadSystemSettingView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor centerBackgroundColor];
    
    self.navigationItem.title = @"BI - 设置";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickBackOff)];
}



#pragma mark - action implementations
- (void) clickBackOff
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
