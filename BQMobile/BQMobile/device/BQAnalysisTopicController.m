//
//  BQAnalysisTopicController.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-18.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQAnalysisTopicController.h"

#import "BQCore.h"
#import "BQTemplateResolver.h"
#import "BQComponent.h"

@interface BQAnalysisTopicController ()

@end

@implementation BQAnalysisTopicController

- (id)initWithTemplate:(NSString*)templatePath {
    if (self = [super init]) {
        self.templatePath = templatePath;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载组件集合
    [self loadComponentViews];
    
}

- (void)loadComponentViews {
    // 获得XML TODO
    NSString* filePath = resourceBundleAndRelative(@"Demo", @"test.xml");
    GDataXMLDocument* doc = [XMLUtils loadXMLFile:filePath];
    
    // 创建上下文
    NSMutableDictionary* context = [self createContext];
    
    // 解析xml，创建组件视图集合
    self.rootView = [BQTemplateResolver resolver:[doc rootElement] withRelativePath:filePath withContext:context];
    [self.rootView rerender:self.view.frame];
    [self.view addSubview:self.rootView.contentView];
}

// 创建上下文
- (NSMutableDictionary*)createContext {
    NSMutableDictionary* context = [[NSMutableDictionary alloc] init];
    
    // TODO 添加系统属性、上下文传入等
    
    return context;
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
