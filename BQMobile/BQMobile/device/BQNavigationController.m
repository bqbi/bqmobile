//
//  BQNavigationController.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQNavigationController.h"
#import "BQMobileResource.h"

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
    UIImage * alphaImage = [[BQMobileResource sharedManager].navibarBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(rect.origin.y, rect.origin.x, rect.origin.y+rect.size.height, rect.origin.x+rect.size.width)];
    [self.navigationBar setBackgroundImage:alphaImage forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.translucent = YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
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

#pragma mark - 重载父类进行改写
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //先进入子Controller
    [super pushViewController:viewController animated:animated];
    
    //替换掉leftBarButtonItem
    if (viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] > 1) {
        viewController.navigationItem.leftBarButtonItem =[self customLeftBackButton];
    }
}

#pragma mark - 自定义返回按钮图片
- (UIBarButtonItem*) customLeftBackButton{
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGSize imageSize = [BQMobileResource sharedManager].navibarBackButtonColdImage.size;
    backButton.frame = CGRectMake(12, 0, imageSize.width, imageSize.height);
    
    [backButton setBackgroundImage:[BQMobileResource sharedManager].navibarBackButtonColdImage
                          forState:UIControlStateNormal];
    [backButton setBackgroundImage:[BQMobileResource sharedManager].navibarBackButtonHotImage
                          forState:UIControlStateSelected];
    
    
    [backButton addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];

    
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void) popself
{
    [self popViewControllerAnimated:YES];
}


@end
