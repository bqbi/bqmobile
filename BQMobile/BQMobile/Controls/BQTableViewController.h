//
//  SidePanelViewController.h
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQTableViewDataSource.h"

@interface BQTableViewController : UIViewController<UITableViewDelegate>

@property (nonatomic,assign) BOOL hasStateBar;

- (id) initWithDataSource:(BQTableViewDataSource *)ds;

@end
