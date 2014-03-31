//
//  BQEventDispatchManager.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQEventDispatchManager.h"

#pragma mark - static var defined
static BQEventDispatchManager *gBQEventDispatchManager = nil;

@interface BQEventDispatchManager()
@property (nonatomic,strong) NSMutableDictionary *eventDictionary;
@end
@implementation BQEventDispatchManager

+ (BQEventDispatchManager*) sharedManager
{
    if (gBQEventDispatchManager == nil)
    {
        gBQEventDispatchManager = [[self alloc] init];
    }
    return gBQEventDispatchManager;
}

@end
