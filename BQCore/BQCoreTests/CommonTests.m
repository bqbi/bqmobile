//
//  CommonTests.m
//  BQCore
//
//  Created by 潘 巍 on 14-2-18.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Common.h"

@interface CommonTests : XCTestCase

@end

@implementation CommonTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testDeviceIsPad
{
    NSLog(@"----------- is pad %@", [Common deviceIsIpad]?@"YES":@"NO");
}

@end
