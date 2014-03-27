//
//  el.h
//  el
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ExpressionResult : NSObject

@property (nonatomic,retain)    NSString *resultValue;
@property (nonatomic)           NSInteger returnValue;

@end

@interface ElTool : NSObject
+ (ExpressionResult*) El :(NSString*) expression ;
@end
