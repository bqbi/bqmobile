//
//  TableViewDataSourceDelegate.h
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewItem.h"
#import "TableViewSection.h"

@protocol BQTableViewDataSourceDelegate <NSObject>

@optional
/**
 *  parse the tabelview data from the model .
 *
 *  @param the model of dataset or datasource.
 *
 *  @return void.
 */
- (NSArray*) sectionsFromDatasourceModel:(id) model;


@end

#pragma mark - 
//
/**
 *  These options are used to 一些通用事件枚举.
 */
typedef NS_ENUM(NSUInteger, BQEventSelectedMode)
{
    /**
     *  侧边栏-最近打开-功能选择.
     */
    BQEventSelectedModeRecent         =   0,
    
    /**
     *  侧边栏-收件箱-功能选择.
     */
    BQEventSelectedModeInBox          =   1,
    
    /**
     *  侧边栏-收藏夹-功能选择.
     */
    BQEventSelectedModeCollection     =   2,
    /**
     *  侧边栏-收藏夹-功能选择.
     */
    BQEventSelectedModeUserInfo       =   3,
    /**
     *  侧边栏-收藏夹-功能选择.
     */
    BQEventSelectedModeSystemSetting  =   4,
    
};

@protocol BQLeftMenuFunctionDelegate <NSObject>

@optional
- (void) openPanelViewController:(BQEventSelectedMode) eventSelectedMode;

@end