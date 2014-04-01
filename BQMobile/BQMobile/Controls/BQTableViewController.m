//
//  SidePanelViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "BQTableViewController.h"
#import "Color.h"
#import "MSViewControllerSlidingPanel.h"
#import "TableViewItem.h"
#import "TableViewSection.h"



@interface BQTableViewController ()

@property (nonatomic,retain) BQTableViewDataSource * dataSource;
#pragma mark Tool
/** @name Tool */

/**
 *  Reset the default panel values.
 *
 *  @param side The side on which the values must be applied.
 */
- (void)resetDefaultPanelForSide:(MSSPSideDisplayed)side andWidth:(CGFloat)width;
@end

@implementation BQTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithDataSource:(BQTableViewDataSource *)ds
{
    self = [super init];
    if (self)
    {
        self.dataSource = ds;
    }
    return  self;
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
//    [self resetDefaultPanelForSide:MSSPSideDisplayedLeft andWidth:280];
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _hasStateBar? 20:0, windowSize.width, windowSize.height)];

    [tableView setDataSource:self.dataSource];
    [tableView setDelegate:self];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[self.dataSource tableCellIdentifier]];
    [tableView setTableFooterView:[[UIView alloc] init]];
    [tableView setBackgroundColor:[UIColor menuBackgroundColor]];
    [tableView setSeparatorColor:[UIColor menuTableViewSeparatorsColor]];
    [tableView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    
    
    [[self view] addSubview:tableView];
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
    TableViewSection    *section;
    
    section = [[self dataSource] sectionAtIndex:[indexPath section]];
    
    
    [section selectItemAtIndex:[indexPath row]];
    
    
    
    return indexPath;
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
