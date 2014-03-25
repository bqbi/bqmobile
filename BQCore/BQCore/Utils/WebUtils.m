//
//  WebUtils.m
//  BQCore
//
//  Created by 潘 巍 on 14-3-24.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "WebUtils.h"

#import "ASIHTTPRequest.h"
#import "BQViewOperateModel.h"
#import "Common.h"


@implementation WebUtils


/*
 *  发出同步请求
 */
+ (BQViewOperateModel*) invokeSyncRequest:(NSString*)urlString{
    return [self invokeSyncRequest:urlString timeout:GLOBAL_REQUEST_TIMEOUT];
}

+ (BQViewOperateModel*) invokeSyncRequest:(NSString*)urlString timeout:(int)seconds{
    
    // 创建一个URL
    NSURL* url = [NSURL URLWithString:urlString];
    
    ASIHTTPRequest* req = [ASIHTTPRequest requestWithURL:url];
    if (seconds > 0) {
        [req setTimeOutSeconds:seconds];
    }
    [req setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    
    // 发出同步请求
    [req startSynchronous];
    
    // 响应请求
    return [self makeViewOperateModel:req];
}

+ (BQViewOperateModel*) invokeSyncRequest:(NSString*)urlString withPostData:(NSString*)data{
    return [self invokeSyncRequest:urlString withPostData:data timeout:GLOBAL_REQUEST_TIMEOUT];
}

+ (BQViewOperateModel*) invokeSyncRequest:(NSString*)urlString withPostData:(NSString*)data timeout:(int)seconds{
    // 创建一个URL
    NSURL* url = [NSURL URLWithString:urlString];
    
    ASIHTTPRequest* req = [ASIHTTPRequest requestWithURL:url];
    if (seconds > 0) {
        [req setTimeOutSeconds:seconds];
    }
    [req setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    
    // 以POST方式发送数据
    [req addRequestHeader:@"Content-Type" value:@"text/plain; charset=utf-8"];
    [req setRequestMethod:@"POST"];
    [req appendPostData:[data dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 发出同步请求
    [req startSynchronous];
    
    // 响应请求
    return [self makeViewOperateModel:req];
}


/*
 *  发出异步请求
 */
+ (ASIHTTPRequest*) invokeAsyncRequest:(NSString*)urlString withDidFinishSelector:(SEL)finishSelector withDidFailSelector:(SEL)failSelector{
    return [self invokeAsyncRequest:urlString withDidFinishSelector:finishSelector withDidFailSelector:failSelector timeout:GLOBAL_REQUEST_TIMEOUT];
}

+ (ASIHTTPRequest*) invokeAsyncRequest:(NSString*)urlString withDidFinishSelector:(SEL)finishSelector withDidFailSelector:(SEL)failSelector timeout:(int)seconds{
    
    // 创建一个URL
    NSURL* url = [NSURL URLWithString:urlString];
    
    ASIHTTPRequest* req = [ASIHTTPRequest requestWithURL:url];
    [req setDidFinishSelector:finishSelector];
    [req setDidFailSelector:failSelector];
    if (seconds > 0) {
        [req setTimeOutSeconds:seconds];
    }
    [req setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    
    // 开始异步请求
    [req startAsynchronous];
    
    return req;
    
}

+ (ASIHTTPRequest*) invokeAsyncRequest:(NSString*)urlString withPostData:(NSString*)data withDidFinishSelector:(SEL)finishSelector withDidFailSelector:(SEL)failSelector{
    return [self invokeAsyncRequest:urlString withPostData:data withDidFinishSelector:finishSelector withDidFailSelector:failSelector timeout:GLOBAL_REQUEST_TIMEOUT];
}

+ (ASIHTTPRequest*) invokeAsyncRequest:(NSString*)urlString withPostData:(NSString*)data withDidFinishSelector:(SEL)finishSelector withDidFailSelector:(SEL)failSelector timeout:(int)seconds{
    
    // 创建一个URL
    NSURL* url = [NSURL URLWithString:urlString];
    
    ASIHTTPRequest* req = [ASIHTTPRequest requestWithURL:url];
    [req setDidFinishSelector:finishSelector];
    [req setDidFailSelector:failSelector];
    if (seconds > 0) {
        [req setTimeOutSeconds:seconds];
    }
    [req setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    
    // 以POST方式发送数据
    [req addRequestHeader:@"Content-Type" value:@"text/plain; charset=utf-8"];
    [req setRequestMethod:@"POST"];
    [req appendPostData:[data dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 开始异步请求
    [req startAsynchronous];
    
    return req;
}

/*
 *  取消异步请求
 */
+ (void) cancelAsyncRequest:(ASIHTTPRequest*)req {
    if (req) {
        [req clearDelegatesAndCancel];
    }
}

/*
 *  创建视图操作模型
 *  resp - http响应
 *  responseData - 响应数据
 */
+ (BQViewOperateModel*) makeViewOperateModel:(ASIHTTPRequest*)req {
    
    NSError* err = [req error];
    
    // 如果请求出现错误
    if (err) {
        NSLog(@"Error on response: %@", [err description]);
        return [[BQViewOperateModel alloc] initWithMessage:@"请求网络数据出现错误" withMessageType:MESSAGE_TYPE_ERROR];
    }
    // 正常的请求响应
    else {
        err = nil;
        
        NSData* responseData = [req responseData];
        
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&err];
        
        if (err) {
            NSLog(@"Error on parser json: %@ in %@", [err localizedDescription], [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
            return [[BQViewOperateModel alloc] initWithMessage:@"解析服务器JSON数据出现错误" withMessageType:MESSAGE_TYPE_ERROR];
        }
        
        if (dic && [dic objectForKey:PROP_VIEW_OPERATOR]) {
            int oper = (int)[dic objectForKey:PROP_VIEW_OPERATOR];
            NSDictionary* contentDic = (NSDictionary*)[dic objectForKey:PROP_VIEW_CONTENT];
            return [[BQViewOperateModel alloc] initWithOperator:oper withContent:contentDic];
        }
        
        return [[BQViewOperateModel alloc] initWithOperator:OPERATE_CUSTOM withContent:dic];
    }
    
}

@end
