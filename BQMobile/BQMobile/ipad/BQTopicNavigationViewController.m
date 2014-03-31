//
//  BQTopicNavigationViewController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//
#import "Color.h"
#import "BQTopicNavigationViewController.h"

@interface BQTopicNavigationViewController ()

@end

@implementation BQTopicNavigationViewController

- (void) loadView
{
    CGSize windowSize = [[UIScreen mainScreen] bounds].size;
    [self setView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, windowSize.width, windowSize.height)]];
    [[self view] setBackgroundColor:[UIColor centerBackgroundColor]];
    //
    self.navigationItem.title = @"BI - 主题导航";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickBackOff)];
}

#pragma mark - action implementations
- (void) clickBackOff
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
