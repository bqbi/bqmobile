//
//  LeftPanelViewModel.h
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewDataSourceDelegate.h"
#import "BQIpadHomeContentController.h"

/*
 * 侧边栏数据加载以及事件绑定数据处理模型
 */
@interface BQIpadLeftSidePanelModel : NSObject<TableViewDataSourceDelegate>
// tableview中的section块
@property (nonatomic, strong)   NSArray *sections;
// 功能代理
@property (nonatomic,strong) id<BQLeftSidePanelFunctionDelegate> delegate;
@end
