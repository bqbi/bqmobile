//
//  BQAlertView.h
//  BQMobile
//
//  Created by 潘 巍 on 14-3-27.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BQAlertView : UIAlertView {
    int _selectedButton;
}

// 显示模态框，并等待返回值
- (int)showModal;

@end
