//
//  BQSplashWindowController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQSplashWindowController.h"
#import "BQView.h"
#import "BQCore.h"

@interface BQSplashWindowController ()

@end

@implementation BQSplashWindowController

- (void) loadView
{
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    // 加载背景图片
    UIImageView * backgndView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IphoneResource.bundle/splashing/splash-background"]];
    backgndView.frame = rect;
    self.view = backgndView;
    // 加载中间图片
    UIImage * centerImage = [UIImage imageNamed:@"IphoneResource.bundle/splashing/splash-logo-center"];
    UIImageView * centerLogImageView = [[UIImageView alloc] initWithImage:centerImage];
    centerLogImageView.frame = CGRectMake((rect.size.width - centerImage.size.width)/2.0, rect.size.height / 3.0, centerImage.size.width, centerImage.size.height);
    [self.view addSubview:centerLogImageView];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


@end
