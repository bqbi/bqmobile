//
//  BQLayoutSetting.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQLayoutSetting.h"

CGRect inflectRect (CGRect rect, float offsetX, float offsetY)
{
    return CGRectMake(rect.origin.x + offsetX, rect.origin.y + offsetY, rect.size.width - 2 * offsetX, rect.size.height - 2 * offsetY);
}

CGRect offsetRect (CGRect rect, float offsetX, float offsetY)
{
    return CGRectMake(rect.origin.x + offsetX, rect.origin.y + offsetY, rect.size.width, rect.size.height);
}