//
//  BQAnalysisTopicController.h
//  BQMobile
//
//  Created by 潘 巍 on 14-4-18.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BQComponent;

@interface BQAnalysisTopicController : UIViewController

// 模板路径
@property (nonatomic, strong) NSString* templatePath;

@property (nonatomic, strong) BQComponent* rootView;

// 当前方向
@property (nonatomic) UIInterfaceOrientation orientation;

// 通过模板路径初始化
- (id)initWithTemplate:(NSString*)templatePath;

// 加载组件集合
- (void)loadComponentViews;

@end
