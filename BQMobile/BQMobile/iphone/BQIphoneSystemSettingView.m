//
//  BQIphoneSystemView.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneSystemSettingView.h"
#import "BQIphoneSystemSettingDataSource.h"

@interface BQIphoneSystemSettingView()
@property(nonatomic, retain) id<UITableViewDataSource> delegateDataSource;
@property (nonatomic, retain) id<UITableViewDelegate> delegateTableView;

@end

@implementation BQIphoneSystemSettingView


- (id) initWithFrame:(CGRect)frame andDatasource:(id<UITableViewDataSource>) ds andTableViewDelegate:(id<UITableViewDelegate>)viewDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        _delegateDataSource = ds;
        _delegateTableView = viewDelegate;
    }
    return self;
}

// 加载页面元素
- (void)loadRootView {
    DLog(@"加载登录页面元素")
    // 屏幕大小
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    // 背景图片
    UIImageView * bkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IphoneResource.bundle/sys-skin/loading-page/loading-background"]];
    [self addSubview:bkImageView];
    
    //
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y + 44, rect.size.width, rect.size.height) style:UITableViewStylePlain];
    tableView.dataSource = _delegateDataSource;
    tableView.delegate   = _delegateTableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: tableCellIdentifier];
//    [tableView setTableFooterView:[[UIView alloc] init]];
    [tableView setBackgroundColor:[UIColor whiteColor]];
    [tableView setSeparatorColor:[UIColor orangeColor]];

    [self addSubview:tableView];
    
}

//
//// 调整组件位置-纵向
//- (void)adjustPositionWithPortrait {
//}
//
//// 调整组件位置-横向
//- (void)adjustPositionWithLandscape {
//    
//}


@end
