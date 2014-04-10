//
//  BQIphoneSystemSettingDataSource.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneSystemSettingDataSource.h"
#import "BQLayoutSetting.h"
#import "BQIphoneSystemSettingItem.h"

@interface BQIphoneSystemSettingDataSource ()

@property (nonatomic, retain) NSMutableArray  * items;

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
    _items = [[NSMutableArray alloc] init];
    // 系统设置项

    [_items addObject:[self createItemWithTitle:@"消息推送" andSwitchOn:YES]];

    [_items addObject:[self createItemWithTitle:@"自动登录" andSwitchOn:YES]];
    
    [_items addObject:[self createItemWithTitle:@"服务器设置"]];

    [_items addObject:[self createItemWithTitle:@"清除缓存"]];

    [_items addObject:[self createItemWithTitle:@"显示演示" andSwitchOn:YES]];

    [_items addObject:[self createItemWithTitle:@"更新时间"]];
    
    [_items addObject:[self createItemWithTitle:@"选择皮肤"]];
}

- (BQIphoneSystemSettingItem*) createItemWithTitle:(NSString*)title andSwitchOn:(BOOL)on
{
    UILabel * title0 = [[UILabel alloc] init];
    title0.text = title;
    UISwitch * button0 = [[UISwitch alloc] init];
    button0.on = on;
    BQIphoneSystemSettingItem* item0 = [[BQIphoneSystemSettingItem alloc] initWithFrame:CGRectMake(0, 0, 0, 0) andLeftView:title0 andRightView:button0];
    
    return item0;
 
}

- (BQIphoneSystemSettingItem*) createItemWithTitle:(NSString*)title
{
    UILabel * title0 = [[UILabel alloc] init];
    title0.text = title;
       BQIphoneSystemSettingItem* item0 = [[BQIphoneSystemSettingItem alloc] initWithFrame:CGRectMake(0, 0, 0, 0) andLeftView:title0 andRightView:nil];
    
    return item0;
    
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
    
    
//	cell.textLabel.text = ;
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    [[cell textLabel] setTextColor:[UIColor blackColor]];

    BQIphoneSystemSettingItem * item = [_items objectAtIndex:indexPath.row];
    item.frame = cell.frame;
    [cell addSubview:item];
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
