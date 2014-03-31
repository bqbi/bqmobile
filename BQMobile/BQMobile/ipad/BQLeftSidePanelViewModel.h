//
//  LeftPanelViewModel.h
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewDataSourceDelegate.h"
#import "BQContentViewController.h"
@interface BQLeftSidePanelViewModel : NSObject<TableViewDataSourceDelegate>
@property (nonatomic, strong)   NSArray *sections;
@property (nonatomic,strong) id<BQLeftSidePanelFunctionDelegate> delegate;
@end
