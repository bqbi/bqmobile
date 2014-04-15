//
//  BQLayoutSetting.h
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, BQPageLayout)
{
    Layout_Control_Height = 44,
    Layout_LeftOffset = 12,
    Layout_RightOffset = 12,
    Layout_AutoButton_Height = 38,
};

typedef NS_OPTIONS(NSUInteger, BQSplitterLineLayout)
{
    Layout_SpltLineWidth_2 = 2,
    Layout_SpltLineWidth_4 = 4,
    Layout_SpltLineWidth_12 = 12,
};

// 缩放矩形区域
CGRect inflectRect (CGRect rect, float offsetX, float offsetY);

// 偏移矩形区域
CGRect offsetRect (CGRect rect, float offsetX, float offsetY);