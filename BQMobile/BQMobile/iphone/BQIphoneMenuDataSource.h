//
//  BQIphoneMenuDataSource.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BQIpadHomeController.h"

@interface BQIphoneMenuDataSource : NSObject<BQTableViewDataSourceDelegate>


- (id) initWithFuncDelegate:(id<BQLeftMenuFunctionDelegate>) delg;

@end
