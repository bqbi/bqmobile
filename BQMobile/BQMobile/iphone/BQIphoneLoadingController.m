//
//  BQIphoneLoadingController.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneLoadingController.h"

@interface BQIphoneLoadingController ()

@end

@implementation BQIphoneLoadingController

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
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    // 加载背景图片
    UIImage * bkImage = [UIImage imageNamed:@"IphoneResource.bundle/sys-skin/loading/loading-background"];
    UIImageView * bkImagView = [[UIImageView alloc] initWithImage:bkImage];
    bkImagView.frame = rect;
    [self.view addSubview:bkImagView];
    // 增加中心图标
    UILabel * centerImage = [[UILabel alloc] init];
    centerImage.frame = CGRectMake((rect.size.width - 80) / 2.0, rect.size.height / 4.0, 80, 80);
    centerImage.text = @"B Q";
    centerImage.font = [UIFont systemFontOfSize:30];
    centerImage.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    centerImage.textAlignment = NSTextAlignmentCenter;
    centerImage.textColor = [UIColor redColor];
    [self.view addSubview:centerImage];
    // 增加底部logo
    UIImage * bottomImage = [UIImage imageNamed:@"IphoneResource.bundle/sys-skin/loading/loading-logo-bottom"];
    UIImageView * bottomImageView = [[UIImageView alloc] initWithImage:bottomImage];
    bottomImageView.frame = CGRectMake((rect.size.width - bottomImage.size.width/2)/2.0, rect.size.height-bottomImage.size.height-4, bottomImage.size.width/2, bottomImage.size.height/2);
    [self.view addSubview:bottomImageView];
}

@end
