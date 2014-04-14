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
#import "BQMobileResource.h"

@interface BQSplashWindowController ()

@end

@implementation BQSplashWindowController

- (void) loadView
{
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    // 加载背景图片
    UIImageView * backgndView = [[UIImageView alloc] initWithImage:[BQMobileResource sharedManager].splashBackgroundImage];
    backgndView.frame = rect;
    self.view = backgndView;
    // 加载中间图片
    UIImage * centerImage = [BQMobileResource sharedManager].splashCenterLogoImage;
    UIImageView * centerLogImageView = [[UIImageView alloc] initWithImage:centerImage];
    centerLogImageView.frame = CGRectMake((rect.size.width - centerImage.size.width/2)/2.0, rect.size.height / 4.0, centerImage.size.width/2, centerImage.size.height/2);
    [self.view addSubview:centerLogImageView];
    
    // 增加底部logo
    UIImage * bottomImage = [BQMobileResource sharedManager].splashFooterLogoImage;
    UIImageView * bottomImageView = [[UIImageView alloc] initWithImage:bottomImage];
    bottomImageView.frame = CGRectMake((rect.size.width - bottomImage.size.width/2)/2.0, rect.size.height - bottomImage.size.height - 4, bottomImage.size.width/2, bottomImage.size.height/2);
    [self.view addSubview:bottomImageView];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


@end
