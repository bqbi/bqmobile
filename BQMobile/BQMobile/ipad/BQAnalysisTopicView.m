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
    NSString* bundlePath = resourceBundle(@"Chart.bundle/");
    [NSString stringWithFormat:@"%@.bundle",filePath];
//    NSString* bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Chart.bundle"];
    pie = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 800, 600)];
    
    [self addSubview:pie];
    
    NSString* htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    pie.scalesPageToFit=YES;
    [pie loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:bundlePath]];
    
//    NSURL* url = [NSURL fileURLWithPath:filePath];
//    NSURLRequest* request = [NSURLRequest requestWithURL:url];
//    pie.scalesPageToFit=YES;
//    [pie loadRequest:request];
    
    
}

// 调整组件位置-纵向
- (void)adjustPositionWithPortrait {
    
}

// 调整组件位置-横向
- (void)adjustPositionWithLandscape {
    
}

@end
