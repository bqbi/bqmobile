//
//  BQAlertView.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-27.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQAlertView.h"

@implementation BQAlertView

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    _selectedButton = (int)buttonIndex;
}

- (int)showModal {
    _selectedButton = -1;
    self.delegate = self;
    [self show];
    
    NSRunLoop* curRunLoop = [NSRunLoop currentRunLoop];
    while ([curRunLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.5]]) {
        if (_selectedButton != -1) {
            break;
        }
    }
    return _selectedButton;
}

@end
