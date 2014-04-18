//
//  el.m
//  el
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "ElUtils.h"
#import "klel.h"
#import "Common.h"

@implementation ExpressionResult
@end
@implementation ElUtils

+ (ExpressionResult*) El :(NSString*) expression
{
    char* expr = (char*)expression.UTF8String;
    char szValue[255] = {0};
    ExpressionResult    *expressionResult;
    expressionResult = [[ExpressionResult alloc] init];
    expressionResult.valueType   = EXPRESSION_RETURN_TYPE_STRING;
    expressionResult.returnValue = executeExpression(expr, szValue);
    expressionResult.resultValue = [[NSString alloc] initWithUTF8String:szValue];
    NSLog(@"executeExpression = %s",szValue);
    return expressionResult;
}

+ (ExpressionResult*) El :(NSString*) expression andContext:(NSDictionary*)context
{
    if (![Common isObjectNull:expression] && [Common isStringEmpty:expression])
    {
        if ([Common beginWith:expression prefix:@"${"] && [Common endWith:expression prefix:@"}"])
        {
            NSString * realExpression = [Common subString:expression start:2 stop:(int)([expression length]-2)];
            // 是否为方法调用
            if ([Common beginWith:realExpression prefix:@"fun:"]) {
                
            }
        }
    }
    return nil;
    
}

+ (ExpressionResult*) _El_Function :(NSString*) expression andContext:(NSDictionary*)context
{
    if ([Common beginWith:expression prefix:@"fun:"]) {
        
    }
    return nil;
}

@end
