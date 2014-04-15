//
//  BQTableViewDataSource.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//
#import "Color.h"
#import "BQTableViewDataModel.h"


@interface BQTableViewDataModel()
@property (nonatomic,assign) id<BQTableViewDataSourceDelegate> delegate;
// tableview中的section块
@property (nonatomic, strong)   NSArray *sections;

@end
@implementation BQTableViewDataModel

- (id) initWithDataModel:(id)model andDelegate:(id<BQTableViewDataSourceDelegate>) delg
{
    [self setDelegate:delg];
    self.sections = [self.delegate sectionsFromDatasourceModel:model];
    return  self;
}

- (NSString*) tableCellIdentifier
{
    return @"CellIdentifier";
}


#pragma mark UITableViewDataSource protocol
/** @name UITableViewDataSource protocol */

/**
 *  Give the number of sections in a table view.
 *
 *  @param tableView The table view.
 *
 *  @return The number of values.
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ([[self sections] count]);
}

/**
 *  Return the cell for the index path in the table view.
 *
 *  @param tableView The table view.
 *  @param indexPath The index path.
 *
 *  @return The cell.
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    TableViewItem   *item;
    
    cell = [tableView dequeueReusableCellWithIdentifier:[self tableCellIdentifier]];
    item = [self itemAtIndexPath:indexPath];
    
    [[cell textLabel] setText:[item name]];
    [cell textLabel].font = [UIFont systemFontOfSize:12];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    [cell setSelectedBackgroundView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, [cell frame].size.width, [cell frame].size.height)]];
    //    [[cell selectedBackgroundView] setBackgroundColor:[UIColor menuTableViewCellBackgroundSelectedColor]];
    [[cell selectedBackgroundView] setBackgroundColor:[UIColor purpleColor]];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

    
    return (cell);
}

/**
 *  Return the number of rows in a section of a table view.
 *
 *  @param tableView The table view.
 *  @param section   The section number.
 *
 *  @return The number of rows.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([[self sectionAtIndex:section] numberOfItems]);
}

/**
 *  Return the title of the header of a section.
 *
 *  @param tableView The table view.
 *  @param section   The section number.
 *
 *  @return The title.
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return ([[self sectionAtIndex:section] name]);
}

#pragma mark UITableViewDelegate protocol
/** @name UITableViewDelegate protocol */

/**
 *  Called when a cell will be selected.
 *
 *  @param tableView The table view.
 *  @param indexPath The cell's index path.
 *
 *  @return The indexpath of the cell which must be selected.
 */
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath         *tmpIndexPath;
    TableViewSection    *section;
    
    section = [self sectionAtIndex:[indexPath section]];
    
    if ([section selectionRule] == SelectionRuleNone)
        [section selectItemAtIndex:[indexPath row]];
    else if ([section selectionRule] == SelectionRuleOnlyOne)
    {
        tmpIndexPath = [NSIndexPath indexPathForRow:[section itemSelectedIndex] inSection:[indexPath section]];
        [[tableView cellForRowAtIndexPath:tmpIndexPath] setAccessoryType:UITableViewCellAccessoryNone];
        [section selectItemAtIndex:[indexPath row]];
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
    {
        [section selectItemAtIndex:[indexPath row]];
        
        if ([[section itemAtIndex:[indexPath row]] checked])
            [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
        else
            [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return (nil);
}

#pragma mark - 自定义树结构的处理
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
