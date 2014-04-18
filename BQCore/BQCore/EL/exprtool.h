//
//  exprtool.h
//  BQCore
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSStack : NSObject
-(id) initWithCapacity:(NSInteger)count;
// 入栈操作
- (void) push:(id) obj;
// 出栈操作
- (id) pop;
// 取栈顶操作
- (id) top;
// 栈大小
- (NSInteger) size;
// 清空
- (void) clear;
@end


