//
//  BQLoadView.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-19.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BQLoadView : UIView

@property (nonatomic, retain) UIActivityIndicatorView* indicatorView;

// 显示加载视图
- (void)showLoadView;

// 隐藏加载视图
- (void)hideLoadView;

@end
