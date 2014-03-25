//
//  BQCommonUI.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-19.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCommonUI.h"

@implementation BQCommonUI

// 消息框
+ (void)msgBox:(NSString*)msg {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg
                        delegate:nil cancelButtonTitle:@"确 定"
                        otherButtonTitles:nil];
    [alert show];
}

// 错误框
+ (void)errBox:(NSString*)msg {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"错误" message:msg
                        delegate:nil cancelButtonTitle:@"确 定"
                        otherButtonTitles:nil];
    [alert show];
}


@end
