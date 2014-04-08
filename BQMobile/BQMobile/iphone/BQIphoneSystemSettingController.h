//
//  BQIphoneSystemSettingController.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQIphoneSystemSettingView.h"

@interface BQIphoneSystemSettingController : UIViewController
{
    UIInterfaceOrientation orientation; // 当前屏幕位置
}
@property (nonatomic,retain) BQIphoneSystemSettingView* settingView;

@end
