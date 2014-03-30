//
//  BQAppDelegate.h
//  BQMobile
//
//  Created by 潘 巍 on 14-2-18.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQLoginController.h"

@interface BQAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) UIWindow* window;
@property (nonatomic, retain) UINavigationController* navigationController;
@property (nonatomic, retain) BQLoginController* loginController;

@end