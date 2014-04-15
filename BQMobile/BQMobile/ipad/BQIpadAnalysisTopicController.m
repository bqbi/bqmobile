//
//  BQAnalysisTopicController.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-27.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIpadAnalysisTopicController.h"

#import "BQCore.h"
#import "BQComponentFactory.h"
#import "BQComponentView.h"

#import "BQCOMCompositionResolver.h"


@interface BQIpadAnalysisTopicController ()

@end


@implementation BQIpadAnalysisTopicController

- (id)initWithTemplate:(NSString*)templatePath {
    if (self = [super init]) {
        self.templatePath = templatePath;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [BQCOMCompositionResolver createComponentView:nil withParentView:self.view];
    
    // 加载组件集合
    [self loadComponentViews];
    
}

- (void)loadComponentViews {
    // 清空界面
    if (self.rootView) {
        for (UIView* view in [self.rootView subviews]) {
            [view removeFromSuperview];
        }
    }
    
    // 获得XML
    NSString* filePath = resourceBundleAndRelative(@"Demo", @"test.xml");
    GDataXMLDocument* doc = [XMLUtils loadXMLFile:filePath];
    
    // 解析xml，创建组件视图集合
    BQComponentFactory* factory = [BQComponentFactory sharedComponents];
    self.rootView = [factory createComponent:[doc rootElement] withRelativePath:filePath];
    
    [self.view addSubview:self.rootView];
}

- (void)viewWillAppear:(BOOL)animated {
    // 1.隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 2.调整位置
    [self adjustPosition];
    
}

- (void)adjustPosition {
    DLog(@"显示页面方向为%@",(UIInterfaceOrientationIsPortrait(self.interfaceOrientation))?@"竖屏":@"横屏");
    self.orientation = self.interfaceOrientation;
    if (UIInterfaceOrientationIsPortrait(self.orientation)) {
        // TODO
    } else {
    
    }
}

- (BOOL)shouldAutorotate {
    if (self.orientation != self.interfaceOrientation) {
        [self adjustPosition];
    }
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}


@end
