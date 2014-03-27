//
//  LeftPanelViewController.m
//  LeftDragPanelDemo
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "LeftPanelViewController.h"


@interface LeftPanelViewController () 


@end

@implementation LeftPanelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

#pragma mark View life cycle
/** @name View life cycle */


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
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return (cell);
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
    return indexPath;
}



@end
