//
//  el.h
//  el
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import <Foundation/Foundation.h>
enum EXPRESSION_RETURN_TYPE
{
    EXPRESSION_RETURN_TYPE_STRING = 0,
    EXPRESSION_RETURN_TYPE_OBJECT
};
@interface ExpressionResult : NSObject

@property (nonatomic,retain)    NSString *resultValue;
@property (nonatomic)           NSInteger returnValue;
@property (nonatomic)           NSInteger valueType;
@end

@interface ElUtils : NSObject
+ (ExpressionResult*) El :(NSString*) expression ;
+ (ExpressionResult*) El :(NSString*) expression andContext:(NSDictionary*)context;
@end
