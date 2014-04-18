//
//  exprtool.m
//  BQCore
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//


#import "exprtool.h"

@interface NSStack ()
@property (nonatomic,retain) NSMutableArray* data;
@end

@implementation NSStack

-(id) initWithCapacity:(NSInteger)count
{
    self = [super init];
    if (self)
    {
        _data = [[NSMutableArray alloc] initWithCapacity:count];
    }
    return self;
}
// 入栈操作
- (void) push:(id) obj
{
    if (_data)
    {
        [_data addObject:obj];
    }
}
// 出栈操作
- (id) pop
{
    if (_data && [_data count] != 0)
    {
        id obj = [_data objectAtIndex:[_data count]-1];
        [_data removeObject:obj];
        return  obj;
    }
    return  nil;
}
// 取栈顶操作
- (id) top
{
    if (_data && [_data count] != 0)
    {
        return [_data objectAtIndex:[_data count]-1];
    }
    return nil;
}
// 栈大小
- (NSInteger) size
{
    return [_data count];
}
- (void) clear
{
    [_data removeAllObjects];
}

@end