//
//  BQMobileResource.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQMobileResource.h"

static BQMobileResource * gBQMobileResource = nil;
@interface BQMobileResource()
@property (nonatomic, retain) NSString * skinPath;
@end
@implementation BQMobileResource
+ (BQMobileResource*) sharedManager
{
    if (!gBQMobileResource) {
        gBQMobileResource = [[[self class] alloc] init];
        [gBQMobileResource setResourcePath:@"IphoneResource.bundle/sys-skin"];
        [gBQMobileResource loadResource];
    }
    return gBQMobileResource;
}

- (void) setResourcePath:(NSString*) path
{
    self.skinPath = path;
}

- (UIImage*) imageFromResource:(NSString*)resourceName
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@/%@", self.skinPath, resourceName]];
}

- (void) loadResource
{
    // 闪屏背景
    _splashBackgroundImage = [self imageFromResource:@"splashing-page/splash-background"];
    // 闪屏中间logo
    _splashCenterLogoImage = [self imageFromResource:@"splashing-page/splash-logo-center"];
    // 闪屏底部logo
    _splashFooterLogoImage = [self imageFromResource:@"splashing-page/splash-logo-bottom"];
    /*
     * 页面加载等候页面资源
     * 包括：背景、中间logo、底部logo
     */
    // 加载页面 背景
    _loadingBackgroundImage = [self imageFromResource:@"loading-page/loading-background"];
    // 加载页面 中间logo
    _loadingCenterLogoImage = [self imageFromResource:@"loading-page/loading-logo-bottom"];
    // 加载页面 底部logo
    _loadingFooterLogoImage = [self imageFromResource:@"loading-page/loading-logo-bottom"];
    /*
     * 登录页面资源
     *
     */
    // 背景
    _loginBackgroundImage   = [self imageFromResource:/*@"login-page/login-background"*/@"loading-page/loading-background"];
    // 用户输入背景图片
    _loginUserImage         = [self imageFromResource:@"login-page/login-user@2x"];
    // 用户密码框背景图片
    _loginPasswordImage     = [self imageFromResource:@"login-page/login-password@2x"];
    // 登录按钮图片
    _loginButtonColdImage   = [self imageFromResource:@"login-page/login-button-cold@2x"];
    // 登录按钮热点图片
    _loginButtonHotImage    = [self imageFromResource:@"login-page/login-button-hot@2x"];
    /*
     *
     * 导航栏资源
     *
     */
    // 背景
    _navibarBackgroundImage = [self imageFromResource:@"navigationbar/navi-background@2x"];
    _navibarBackgroundImage = [self reSizeImage:_navibarBackgroundImage toSize:CGSizeMake(_navibarBackgroundImage.size.width/2, _navibarBackgroundImage.size.height/2)];
    /*
     * 侧边栏目录资源
     *
     */
    _leftMenuBackgroundImage= [self imageFromResource:@"leftmenu-page/leftmenu-background"];

}

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}




@end
