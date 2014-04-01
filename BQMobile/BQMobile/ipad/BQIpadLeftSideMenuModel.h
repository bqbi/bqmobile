//
//  LeftPanelViewModel.h
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BQIpadHomeController.h"
/*
 * 侧边栏数据加载以及事件绑定数据处理模型
 */
@interface BQIpadLeftSideMenuModel : NSObject<BQTableViewDataSourceDelegate>


- (id) initWithFuncDelegate:(id<BQLeftSidePanelFunctionDelegate>) delg;
@end
