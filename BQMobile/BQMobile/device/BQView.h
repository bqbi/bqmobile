//
//  BQView.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-27.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQLayoutSetting.h"

@interface BQView : UIView

// 加载页面元素
- (void)loadRootView;

// 调整组件位置-纵向
- (void)adjustPositionWithPortrait;

// 调整组件位置-横向
- (void)adjustPositionWithLandscape;

@end
