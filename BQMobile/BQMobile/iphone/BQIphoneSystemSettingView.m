//
//  BQIphoneSystemView.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneSystemSettingView.h"

@implementation BQIphoneSystemSettingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// 加载页面元素
- (void)loadRootView {
    DLog(@"加载登录页面元素")
    
    // 清空界面
    for (UIView* view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    //
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.dataSource = self.delegateDataSource;
    tableView.delegate   = self.delegateTableView;
    [self addSubview:tableView];
    
}


- (void) onClickButton:(UIControl*)button
{
//    [self.delegate onIphonePressedButton:button.tag];
}


// 调整组件位置-纵向
- (void)adjustPositionWithPortrait {
}

// 调整组件位置-横向
- (void)adjustPositionWithLandscape {
    
}


@end
