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

@property (nonatomic, strong) UIScrollView* contentView;

- (void)loadComponentViews;

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
    
    // TODO
    self.contentView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:self.contentView];
    
    
    
    
    
    
    [BQCOMCompositionResolver createComponentView:nil withParentView:self.view];
    
    // 加载组件集合
    [self loadComponentViews];
    
}

- (void)loadComponentViews {
    // 清空界面
    for (UIView* view in [self.contentView subviews]) {
        [view removeFromSuperview];
    }
    
    self.componentViews = [NSMutableArray array];
    
    // 解析xml，创建组件视图集合
    // TODO
    [BQComponentFactory sharedComponents];
    
    
    
    
    // 将组件加入到contentView中
    int i = 0;
    for (UIView* view in self.componentViews) {
        [self.contentView addSubview:view];
        // delegate
        [view setUserInteractionEnabled:YES];
        [view setTag:i];
        i++;
        
        UITapGestureRecognizer* tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(componentTouchUp:)];
        tapped.numberOfTapsRequired = 1;
        [view addGestureRecognizer:tapped];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    // 1.隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    // 2.调整位置
    [self adjustPosition];
    
}

- (void)componentTouchUp:(id)sender {
    UITapGestureRecognizer* gesture = (UITapGestureRecognizer*)sender;
    DLog(@"Taped Compoment tag is %d", gesture.view.tag);
    
    BQComponentView* view = [self.componentViews objectAtIndex:gesture.view.tag];
    [view onTouchUp];
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
