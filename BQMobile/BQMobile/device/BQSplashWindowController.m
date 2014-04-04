//
//  BQSplashWindowController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQSplashWindowController.h"
#import "BQView.h"

@interface BQSplashWindowController ()

@end

@implementation BQSplashWindowController


- (void) loadView
{
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    self.view = [[BQView alloc] initWithFrame:rect];
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    UILabel * txt = [[UILabel alloc] initWithFrame:CGRectMake(rect.size.width/2.0 - 60, 60, 120, 30)];
    [txt setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    [txt setText:@"请增加闪屏图片"];
    [txt setTextColor:[UIColor colorWithRed:0.6 green:0.4 blue:0.2 alpha:1]];
    [txt setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:txt];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
