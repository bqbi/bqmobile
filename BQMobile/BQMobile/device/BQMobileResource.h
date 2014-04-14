//
//  BQMobileResource.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BQMobileResource : NSObject
// 静态获取对象方法 （单例模式）
+ (BQMobileResource*) sharedManager;

- (void) setSkinPath:(NSString*) skinPath;
/*
 * 闪屏图片资源
 * 包括：背景、中间logo、底部logo
 */
// 闪屏背景
@property (nonatomic, retain, readonly) UIImage * splashBackgroundImage;
// 闪屏中间logo
@property (nonatomic, retain, readonly) UIImage * splashCenterLogoImage;
// 闪屏底部logo
@property (nonatomic, retain, readonly) UIImage * splashFooterLogoImage;

/*
 * 页面加载等候页面资源
 * 包括：背景、中间logo、底部logo
 */
// 加载页面 背景
@property (nonatomic, retain, readonly) UIImage * loadingBackgroundImage;
// 加载页面 中间logo
@property (nonatomic, retain, readonly) UIImage * loadingCenterLogoImage;
// 加载页面 底部logo
@property (nonatomic, retain, readonly) UIImage * loadingFooterLogoImage;


/*
 * 登录页面资源
 *
 */
// 背景
@property (nonatomic, retain, readonly) UIImage * loginBackgroundImage;
// 用户输入背景图片
@property (nonatomic, retain, readonly) UIImage * loginUserImage;
// 用户密码框背景图片
@property (nonatomic, retain, readonly) UIImage * loginPasswordImage;
// 登录按钮图片
@property (nonatomic, retain, readonly) UIImage * loginButtonColdImage;
// 登录按钮热点图片
@property (nonatomic, retain, readonly) UIImage * loginButtonHotImage;
/*
 *
 * 导航栏资源
 *
 */
// 背景
@property (nonatomic, retain, readonly) UIImage * navibarBackgroundImage;

/*
 * 侧边栏目录资源
 *
 */
@property (nonatomic, retain, readonly) UIImage * leftMenuBackgroundImage;
//


/*
 *
 * 设置页面资源
 *
 */



@end
