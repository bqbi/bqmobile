//
//  BQIphoneSystemView.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQView.h"

@interface BQIphoneSystemSettingView : BQView

@property(nonatomic, assign) id<UITableViewDataSource> delegateDataSource;
@property (nonatomic, assign) id<UITableViewDelegate> delegateTableView;
@end
