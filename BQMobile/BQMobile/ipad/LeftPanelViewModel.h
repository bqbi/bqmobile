//
//  LeftPanelViewModel.h
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewDataSourceDelegate.h"
@interface LeftPanelViewModel : NSObject<TableViewDataSourceDelegate>
@property (nonatomic, strong)   NSArray *sections;
@end
