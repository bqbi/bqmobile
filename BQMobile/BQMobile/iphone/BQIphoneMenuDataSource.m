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
@property (nonatomic,assign) id<BQLeftMenuFunctionDelegate> delegate;
@end
@implementation BQIphoneMenuDataSource

- (id) initWithFuncDelegate:(id<BQLeftMenuFunctionDelegate>) delg
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
    itemRecentView = [TableViewItem tableViewItemCheckableWithName:@"用户信息"];
    [itemRecentView setActionWhenSelected:^(void)
     {
         NSLog(@"（用户信息) :%s", __FUNCTION__);
         [self.delegate openPanelViewController:BQEventSelectedModeUserInfo];
     }];
    
    itemInBoxView = [TableViewItem tableViewItemCheckableWithName:@"系统设置"];
    [itemInBoxView setActionWhenSelected:^(void)
     {
         NSLog(@"(系统设置) :%s", __FUNCTION__);
         [self.delegate openPanelViewController:BQEventSelectedModeSystemSetting];
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
