//
//  BQMobileResource.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQResource.h"
#import "BQCore.h"

static BQResource * gBQMobileResource = nil;


@interface BQResource()

@property (nonatomic, retain) NSString * devicePath;

@end


@implementation BQResource

+ (BQResource*) sharedManager
{
    if (!gBQMobileResource) {
        gBQMobileResource = [[[self class] alloc] init];
        [gBQMobileResource setResourcePath:(isPad?@"ipad":@"iphone")];
        [gBQMobileResource loadResource];
    }
    return gBQMobileResource;
}

- (void) setResourcePath:(NSString*) path
{
    self.devicePath = path;
}

- (UIImage*) imageFromResource:(NSString*)resourceName
{
    UIImage * image = [FSUtils loadImage:[NSString stringWithFormat:@"%@/%@", self.devicePath, resourceName]];
    
    if (image == nil) {
        image = [FSUtils loadImage:[NSString stringWithFormat:@"device/%@", resourceName]];
    }
    
    if (image == nil) {
        return nil;
    }
    
    NSString * endWith2x = [resourceName substringFromIndex:resourceName.length-3];
    if ([endWith2x compare:@"@2x"] == 0) {
        image = [self reSizeImage:image toSize:CGSizeMake(image.size.width / 2.0, image.size.height / 2.0)];
    }
    return image;
}

- (void) loadResource
{
    // 闪屏背景
    _splashBackgroundImage = [self imageFromResource:@"splash_background"];
    // 闪屏中间logo
    _splashCenterLogoImage = [self imageFromResource:@"splash_logo_center"];
    // 闪屏底部logo
    _splashFooterLogoImage = [self imageFromResource:@"splash_logo_bottom"];
    /*
     * 页面加载等候页面资源
     * 包括：背景、中间logo、底部logo
     */
    // 加载页面 背景
    _loadingBackgroundImage = [self imageFromResource:@"loading_background"];
    // 加载页面 中间logo
    _loadingCenterLogoImage = [self imageFromResource:@"loading_logo_bottom"];
    // 加载页面 底部logo
    _loadingFooterLogoImage = [self imageFromResource:@"loading_logo_bottom"];
    /*
     * 登录页面资源
     *
     */
    // 背景
    _loginBackgroundImage   = [self imageFromResource:/*@"login-page/login-background"*/@"loading_background"];
    // 用户输入背景图片
    _loginUserImage         = [self imageFromResource:@"user_background@2x"];
    // 用户密码框背景图片
    _loginPasswordImage     = [self imageFromResource:@"password_background@2x"];
    // 登录按钮图片
    _loginButtonColdImage   = [self imageFromResource:@"button_login@2x"];
    // 登录按钮热点图片
    _loginButtonHotImage    = [self imageFromResource:@"button_login_touched@2x"];
    /*
     *
     * 导航栏资源
     *
     */
    // 背景
    _navibarBackgroundImage = [self imageFromResource:@"navi_background@2x"];
    // 返回
    _navibarBackButtonColdImage    = [self imageFromResource:@"button_back@2x"];
    _navibarBackButtonHotImage     = [self imageFromResource:@"button_back_touched@2x"];
    // 设置
    _navibarSettingButtonColdImage = [self imageFromResource:@"button_setting@2x"];
    _navibarSettingButtonHotImage  = [self imageFromResource:@"button_setting_touched@2x"];
    // 编辑
    _navibarEditButtonColdImage    = [self imageFromResource:@"button_edit@2x"];
    _navibarEditButtonHotImage     = [self imageFromResource:@"button_edit-touched@2x"];
    // 目录
    _navibarMenuButtonColdImage    = [self imageFromResource:@"button_menu@2x"];
    _navibarMenuButtonHotImage     = [self imageFromResource:@"button_menu_touched@2x"];
    
    // 工具条
    // 关注
    _toolbarBackgroundImage        = [self imageFromResource:@"toolbar_background@2x"];
    _toolbarFaverateColdImage      = [self imageFromResource:@"button_faverate@2x"];
    _toolbarFaverateHotImage       = [self imageFromResource:@"button_faverate_touched@2x"];

    /*
     * 侧边栏目录资源
     *
     */
    _leftMenuBackgroundImage= [self imageFromResource:@"menu-background@2x"];
    
    // alpha image
    _alphaImage             = [self imageFromResource:@"alpha_background@2x.jpg"];
    
    
    // 服务器地址设置资源
    _serverSettingSaveButtonColdImage = [self imageFromResource:@"button_save@2x"];
    _serverSettingSaveButtonHotImage = [self imageFromResource:@"button_save_touched@2x"];

}

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
}
    
                                



@end
