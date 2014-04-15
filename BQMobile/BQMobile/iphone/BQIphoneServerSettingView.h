//
//  BQServerSettingView.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQView.h"

@interface BQIphoneServerSettingView : BQView

// 服务器地址
@property (nonatomic, retain, readonly) UITextField * server;
// 端口
@property (nonatomic, retain, readonly) UITextField * port;
//
@property (nonatomic, retain, readonly) UIButton * saveButton;
@end
