//
//  BQIphoneMenuDataSource.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneMenuDataSource.h"
@interface BQIphoneMenuDataSource()
// 功能代理
@property (nonatomic,assign) id<BQLeftSidePanelFunctionDelegate> delegate;
@end
@implementation BQIphoneMenuDataSource

- (id) initWithFuncDelegate:(id<BQLeftSidePanelFunctionDelegate>) delg
{
    self = [super init];
    if (self) {
        self.delegate = delg;
    }
    return  self;
}

/*
 * 从某一数据模型读取数据，并封装为section表格块
 */
- (NSArray*) sectionsFromDatasourceModel:(id)model
{
    TableViewItem       *itemRecentView;
    TableViewItem       *itemInBoxView;
    TableViewItem       *itemCollectionView;
    
    TableViewSection    *sysSection;
    itemRecentView = [TableViewItem tableViewItemCheckableWithName:@"最近访问"];
    [itemRecentView setActionWhenSelected:^(void)
     {
         NSLog(@"(最近访问) :%s", __FUNCTION__);
         [self.delegate openPanelViewController:BQEventSelectedModeRecent];
     }];
    
    itemInBoxView = [TableViewItem tableViewItemCheckableWithName:@"收件箱"];
    [itemInBoxView setActionWhenSelected:^(void)
     {
         NSLog(@"(收件箱) :%s", __FUNCTION__);
         [self.delegate openPanelViewController:BQEventSelectedModeInBox];
     }];
    
    itemCollectionView = [TableViewItem tableViewItemCheckableWithName:@"收藏夹"];
    [itemCollectionView setActionWhenSelected:^(void)
     {
         NSLog(@"(收藏夹) :%s", __FUNCTION__);
         [self.delegate openPanelViewController:BQEventSelectedModeCollection];
     }];
    
    
    
    sysSection = [TableViewSection tableViewSectionWitName:@"系统功能"
                                             selectionRule:SelectionRuleOnlyOne
                                                  andItems:itemRecentView,
                  itemInBoxView,
                  itemCollectionView,
                  nil];
    
    return @[sysSection];
    
}

@end
