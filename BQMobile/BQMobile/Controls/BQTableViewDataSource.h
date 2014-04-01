//
//  BQTableViewDataSource.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BQDelegateFamily.h"


@interface BQTableViewDataSource : NSObject<UITableViewDataSource>

// 初始化数据源（根据数据模型）
- (id) initWithDataModel:(id)model andDelegate:(id<BQTableViewDataSourceDelegate>) delg;

- (NSString*) tableCellIdentifier;

/**
 *  Return the sections .
 *
 *  @param none.
 *
 *  @return The sections.
 */
- (NSArray*) sections;

#pragma mark Getting table view sections and items
/** @name Getting table view sections and items */

/**
 *  Return the item at the index path.
 *
 *  @param indexPath The index path.
 *
 *  @return The item.
 */
- (TableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Return the section at the index.
 *
 *  @param index The index.
 *
 *  @return The section.
 */
- (TableViewSection *)sectionAtIndex:(NSInteger)index;
@end
