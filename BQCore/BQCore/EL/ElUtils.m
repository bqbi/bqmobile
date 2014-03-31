//
//  el.m
//  el
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "ElUtils.h"
#import "klel.h"

@implementation ExpressionResult
@end
@implementation ElUtils

+ (ExpressionResult*) El :(NSString*) expression
{
    char* expr = (char*)expression.UTF8String;
    char szValue[255] = {0};
    ExpressionResult    *expressionResult;
    expressionResult = [[ExpressionResult alloc] init];
    
    expressionResult.returnValue = executeExpression(expr, szValue);
    expressionResult.resultValue = [[NSString alloc] initWithUTF8String:szValue];
    NSLog(@"executeExpression = %s",szValue);
    return expressionResult;
}

@end
