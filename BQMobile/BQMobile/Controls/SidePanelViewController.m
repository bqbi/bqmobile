//
//  SidePanelViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "SidePanelViewController.h"
#import "Color.h"
#import "MSViewControllerSlidingPanel.h"
#import "TableViewItem.h"
#import "TableViewSection.h"



#pragma mark - global var defined
/**
 *  Cells' identifier.
 */
NSString    *g_LeftPanelTabelCellIdentifier = @"CellIdentifier";
@interface SidePanelViewController ()

#pragma mark Tool
/** @name Tool */

/**
 *  Reset the default panel values.
 *
 *  @param side The side on which the values must be applied.
 */
- (void)resetDefaultPanelForSide:(MSSPSideDisplayed)side andWidth:(CGFloat)width;
@end

@implementation SidePanelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark View life cycle
/** @name View life cycle */

/**
 *  Creates the view that the controller manages.
 */
- (void)loadView
{
    UITableView *tableView;
    CGSize      windowSize;
    
    windowSize = [[UIScreen mainScreen] bounds].size;
    [self setView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, windowSize.width, windowSize.height)]];
    [self resetDefaultPanelForSide:MSSPSideDisplayedLeft andWidth:280];
    
    if (self.delegate) {
        [self.delegate sectionsFromDatasourceModel:nil];
    }
    

    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _hasStateBar? 20:0, windowSize.width, windowSize.height)];

    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:g_LeftPanelTabelCellIdentifier];
    [tableView setTableFooterView:[[UIView alloc] init]];
    [tableView setBackgroundColor:[UIColor menuBackgroundColor]];
    [tableView setSeparatorColor:[UIColor menuTableViewSeparatorsColor]];
    [tableView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    
    
    [[self view] addSubview:tableView];
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
    return ([[self.delegate sections] count]);
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
    
    cell = [tableView dequeueReusableCellWithIdentifier:g_LeftPanelTabelCellIdentifier];
    item = [self.delegate itemAtIndexPath:indexPath];
    
    [[cell textLabel] setText:[item name]];
    
    [cell setBackgroundColor:[UIColor menuTableViewCellBackgroundColor]];
    [[cell textLabel] setTextColor:[UIColor menuTableViewCellTextColor]];
    [cell setSelectedBackgroundView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, [cell frame].size.width, [cell frame].size.height)]];
    //    [[cell selectedBackgroundView] setBackgroundColor:[UIColor menuTableViewCellBackgroundSelectedColor]];
    [[cell selectedBackgroundView] setBackgroundColor:[UIColor menuTableViewCellBackgroundSelectedColor]];
    
    //    if ([[self.delegate sectionAtIndex:[indexPath section]] selectionRule] == SelectionRuleNone)
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    //    else
    //    {
    //        if ([item checked])
    //            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    //        else
    //            [cell setAccessoryType:UITableViewCellAccessoryNone];
    //    }
    
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
    return ([[self.delegate sectionAtIndex:section] numberOfItems]);
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
    return ([[self.delegate sectionAtIndex:section] name]);
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

    section = [self.delegate sectionAtIndex:[indexPath section]];

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

#pragma mark Tool
/** @name Tool */

/**
 *  Reset the default panel values.
 *
 *  @param side The side on which the values must be applied.
 */
- (void)resetDefaultPanelForSide:(MSSPSideDisplayed)side andWidth:(CGFloat)width
{
    if (side == MSSPSideDisplayedLeft)
    {
        [[self slidingPanelController] setLeftPanelMaximumWidth:width];
        [[self slidingPanelController] setLeftPanelOpenGestureMode:MSSPOpenGestureModeAll];
        [[self slidingPanelController] setLeftPanelCloseGestureMode:MSSPCloseGestureModeAll];
        [[self slidingPanelController] setLeftPanelCenterViewInteractionMode:MSSPCenterViewInteractionNavBar];
    }
    else
    {
        [[self slidingPanelController] setLeftPanelStatusBarDisplayedSmoothly:NO];
        [[self slidingPanelController] setRightPanelStatusBarDisplayedSmoothly:NO];
    }
}
@end
