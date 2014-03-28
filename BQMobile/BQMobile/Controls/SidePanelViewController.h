//
//  SidePanelViewController.h
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewDataSourceDelegate.h"

@interface SidePanelViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,retain) id<TableViewDataSourceDelegate> delegate;

@property (nonatomic,assign) BOOL hasStateBar;

@end
