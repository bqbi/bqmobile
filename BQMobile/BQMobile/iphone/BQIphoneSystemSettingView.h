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


- (id) initWithFrame:(CGRect)frame andDatasource:(id<UITableViewDataSource>) ds andTableViewDelegate:(id<UITableViewDelegate>)viewDelegate;
@end
