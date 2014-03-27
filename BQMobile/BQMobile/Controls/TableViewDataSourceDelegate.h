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

@protocol TableViewDataSourceDelegate <NSObject>

@optional
/**
 *  parse the tabelview data from the model .
 *
 *  @param the model of dataset or datasource.
 *
 *  @return void.
 */
- (void) sectionsFromDatasourceModel:(id) model;
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
