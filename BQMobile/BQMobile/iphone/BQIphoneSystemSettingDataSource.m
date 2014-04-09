//
//  BQIphoneSystemSettingDataSource.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneSystemSettingDataSource.h"
#import "BQLayoutSetting.h"

@implementation BQIphoneSettingItem

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self loadContents];
    }
    return  self;
}

- (void) loadContents
{
    CGRect rect = self.frame;
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(Layout_LeftOffset, 0, rect.size.width*2/3.0, rect.size.height)];
    title.textAlignment = NSTextAlignmentLeft;
    title.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [self addSubview:title];
    UISwitch * switchctrl = [[UISwitch alloc] initWithFrame:CGRectMake(rect.size.width - 80, Layout_SpltLineWidth_4, 0, 0)];
    switchctrl.onTintColor = [UIColor blueColor];
    switchctrl.on = YES;
    [self addSubview:switchctrl];
}

@end

@interface BQIphoneSystemSettingDataSource ()

@property (nonatomic, retain) NSArray * items;

@end

@implementation BQIphoneSystemSettingDataSource

- (id) init
{
    self = [super init];
    if (self) {
        //
        [self loadContents];
    }
    
    return  self;
}

- (void) loadContents
{
    _items = [[NSArray alloc] initWithObjects:@"最近打开",@"最近打开",@"最近打开",@"最近打开",@"最近打开",@"最近打开", nil];
}

- (id) indexOfItemName:(NSInteger)index
{
    if (index >= 0 && index < _items.count) {
        return [_items objectAtIndex:index];
    }
    return  nil;
}

- (NSInteger) itemsCount
{
    return  _items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self itemsCount];// [[UIFont familyNames] count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCellStyle style =  UITableViewCellStyleDefault;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:tableCellIdentifier];

    if (!cell)
		cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:tableCellIdentifier];
    
    
	cell.textLabel.text = [_items objectAtIndex:indexPath.row];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];

    [cell addSubview:[[UISwitch alloc] initWithFrame:CGRectMake([cell frame].size.width-80, 4, 30, 28)]];
    //[cell setSelectedBackgroundView:[[UIView alloc] initWithFrame:CGRectMake([cell frame].size.width-60, 0, [cell frame].size.width, [cell frame].size.height)]];
 
    [[cell selectedBackgroundView] setBackgroundColor:[UIColor whiteColor]];
//
//    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    
    return cell;
}

//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
//{
//    return 2;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section    // fixed font style. use custom view (UILabel) if you want something different
//{
//    return @"BBB";
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return @"AAA";
//}
//

@end
