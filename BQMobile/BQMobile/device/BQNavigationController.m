//
//  BQNavigationController.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQNavigationController.h"

@implementation BQNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect rect  = self.navigationBar.frame;
    // 加载背景图片
    UIImage * alphaImage = [UIImage imageNamed:@"IphoneResource.bundle/sys-skin/alpha.jpg"];
    [self.navigationBar setBackgroundImage:alphaImage forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.translucent = YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    UIImage * bkImage = [UIImage imageNamed:@"IphoneResource.bundle/sys-skin/navigation/navi-background"];
    UIImageView * bkImageView = [[UIImageView alloc] initWithImage:bkImage];
    bkImageView.frame = CGRectMake(rect.origin.x, rect.size.height-bkImage.size.height/2, bkImage.size.width, bkImage.size.height/2);
    [self.navigationBar addSubview:bkImageView];
    //
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                             [UIColor colorWithRed:0 green:0.0 blue:0.0 alpha:1],UITextAttributeTextColor,
                             [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
                             [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                             [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
                             nil]];


}


-(BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    NSUInteger support = [[self.viewControllers lastObject] supportedInterfaceOrientations];
    //
    return support;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}

@end
