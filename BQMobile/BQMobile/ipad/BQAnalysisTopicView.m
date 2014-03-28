//
//  BQAnalysisTopicView.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-27.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQAnalysisTopicView.h"

#import "FSUtils.h"

@implementation BQAnalysisTopicView

@synthesize pie;

// 加载页面元素
- (void)loadRootView {
    DLog(@"加载分析主题页面元素");
    
    // 清空界面
    for (UIView* view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    // 添加背景
    NSString* filePath = resourceBundleAndRelative(@"Chart", @"1.html");
    pie = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 800, 600)];
    NSString* htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [pie loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
    [self addSubview:pie];
}

// 调整组件位置-纵向
- (void)adjustPositionWithPortrait {
    
}

// 调整组件位置-横向
- (void)adjustPositionWithLandscape {
    
}

@end
