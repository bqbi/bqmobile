//
//  LeftPanelViewModel.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "BQLeftSidePanelViewModel.h"

@interface BQLeftSidePanelViewModel()


@end

@implementation BQLeftSidePanelViewModel

- (void) sectionsFromDatasourceModel:(id)model
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
    
    [self setSections: @[sysSection]];

}

/**
 *  Return the sections .
 *
 *  @param none.
 *
 *  @return The sections.
 */
- (NSArray*) sections
{
    return _sections;
}

#pragma mark Getting table view sections and items
/** @name Getting table view sections and items */

/**
 *  Return the item at the index path.
 *
 *  @param indexPath The index path.
 *
 *  @return The item.
 */
- (TableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewSection    *section;
    
    if ([indexPath section] >= [[self sections] count])
        return (nil);
    
    section = [[self sections] objectAtIndex:[indexPath section]];
    
    if ([indexPath row] >= [section numberOfItems])
        return nil;
    
    return ([section itemAtIndex:[indexPath row]]);
}

/**
 *  Return the section at the index.
 *
 *  @param index The index.
 *
 *  @return The section.
 */
- (TableViewSection *)sectionAtIndex:(NSInteger)index
{
    if (index >= [[self sections] count])
        return (nil);
    
    return ([[self sections] objectAtIndex:index]);
}

@end
