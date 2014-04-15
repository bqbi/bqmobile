//
//  BQServerSettingView.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQIphoneServerSettingView.h"
#import "BQLayoutSetting.h"
#import "BQMobileResource.h"

@implementation BQIphoneServerSettingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) loadRootView
{
    
    // 客户区大小
    CGRect rect = inflectRect(self.frame, Layout_LeftOffset, Layout_RightOffset);
    // 背景色
    UIImageView * bkImageView = [[UIImageView alloc] initWithImage:[BQMobileResource sharedManager].loginBackgroundImage];
    bkImageView.frame = self.frame;
    [self addSubview:bkImageView];
    
    // 服务器地址
    _server = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    _server.tag = ServerInfoCtrlTag_Address;
    _server.borderStyle = UITextBorderStyleRoundedRect;
    _server.placeholder = @"服务器地址";
    _server.clearsOnBeginEditing = YES;
    _server.keyboardType = UIKeyboardTypeDecimalPad;
    _server.font = [UIFont systemFontOfSize:12];
    [self addSubview:_server];
    
    // 端口
    _port = [[UITextField alloc] initWithFrame:CGRectMake(rect.origin.x + rect.size.width * 2 / 3.0, rect.origin.y, rect.size.width / 3.0, Layout_Control_Height)];
    _port.tag = ServerInfoCtrlTag_Port;
    _port.borderStyle = UITextBorderStyleRoundedRect;
    _port.placeholder = @"端口";
    _port.clearsOnBeginEditing = YES;
    _port.keyboardType = UIKeyboardTypeNumberPad;
    _port.font = [UIFont systemFontOfSize:12];
    [self addSubview:_port];
    
    // 保存按钮
    _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_saveButton setBackgroundImage:[BQMobileResource sharedManager].serverSettingSaveButtonColdImage forState:UIControlStateNormal];
    [_saveButton setBackgroundImage:[BQMobileResource sharedManager].serverSettingSaveButtonHotImage forState:UIControlStateSelected];
    [_saveButton addTarget:self action:@selector(onSaveSetting) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_saveButton];
}

- (void) adjustPositionWithPortrait
{
    CGRect rect = self.frame;
    CGRect saveButtonFrame = inflectRect(rect, Layout_LeftOffset, Layout_RightOffset);
    
    float fPosition = Layout_Control_Height + Layout_SpltLineWidth_12;
    _server.frame = CGRectMake(rect.origin.x, fPosition, rect.size.width*2/3.0-30, 30);
    //
    _port.frame = CGRectMake(rect.origin.x + rect.size.width * 2 / 3.0, fPosition, rect.size.width / 3.0, 30);
    // 按钮
    _saveButton.frame = CGRectMake(saveButtonFrame.origin.x, fPosition + Layout_SpltLineWidth_12 + Layout_Control_Height, saveButtonFrame.size.width, 36);
}

- (void) onSaveSetting
{
//    NSLog(@"保存服务器设置");
    [_delegate onButtonClick:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
