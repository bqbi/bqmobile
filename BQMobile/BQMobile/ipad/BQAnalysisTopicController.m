//
//  BQAnalysisTopicController.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-27.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQAnalysisTopicController.h"

@implementation BQAnalysisTopicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    atView = [[BQAnalysisTopicView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:atView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    // 1.隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 2.设置view的代理
//    atView.delegate = self;
    
    // 3.加载页面元素
    [atView loadRootView];
    
    // 4.调整位置
//    [self adjustPosition];
    
}

@end
