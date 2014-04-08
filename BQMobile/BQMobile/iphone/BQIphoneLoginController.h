//
//  BQIphoneLoginControllerViewController.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQLoginController.h"
#import "BQIphoneLoginView.h"
@interface BQIphoneLoginController : BQLoginController<UIAlertViewDelegate,UIActionSheetDelegate,UITextFieldDelegate,BQIphoneLoginViewDelegate> {
    
    BQIphoneLoginView* loginView; //登录首页
    
    UIInterfaceOrientation orientation; // 当前屏幕位置
}
@end
