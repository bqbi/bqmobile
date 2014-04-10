//
//  BQIphoneSystemSettingDataSource.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BQControlCommandDelegate <NSObject>
-(void) controlCmd:(UIControl*)ctrl;

@end


static NSString* tableCellIdentifier = @"BQTableCellIdentifier";
@interface BQIphoneSystemSettingDataSource : NSObject<UITableViewDataSource>
- (id) indexOfItemName:(NSInteger)index;
- (NSInteger) itemsCount;
@end
