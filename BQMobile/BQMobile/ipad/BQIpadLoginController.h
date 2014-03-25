//
//  BQIpadLoginController.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQLoginController.h"
#import "BQIpadLoginView.h"

@interface BQIpadLoginController : BQLoginController<UIAlertViewDelegate,UIActionSheetDelegate,UITextFieldDelegate,BQIpadLoginViewDelegate> {
    
    BQIpadLoginView* loginView; //登录首页
    
    UIInterfaceOrientation orientation; // 当前屏幕位置
}

@end
