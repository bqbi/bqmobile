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
    if (![Common isObjectNull:expression] && ![Common isStringEmpty:expression])
    {
        if ([expression hasPrefix:@"${"] && [expression hasSuffix:@"}"])
        {
            NSString * realExpression = [Common subString:expression start:2 stop:(int)([expression length]-1)];
            // 是否为方法调用
            int nPos = 0;
            while (-1 != (nPos = [Common findString:realExpression findWhat:@"@{" startPos:nPos]))
            {
                
                int nEnd = [Common findString:realExpression findWhat:@"}" startPos:nPos];
                if (-1 != nEnd) {
                    NSString * var = [Common subString:realExpression start:nPos+2 stop:nEnd];
                    NSString * parameter = [Common subString:realExpression start:nPos stop:nEnd+1];
                    
                    id value = [context objectForKey:var];
                    // 字符串替换
                    if ([value isKindOfClass:[NSString class]]) {
                        realExpression = [realExpression stringByReplacingOccurrencesOfString:parameter withString:value];
                    }
                }
            }
            // 求值表达式
            return [ElUtils El:realExpression];
            
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
