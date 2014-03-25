//
//  WebUtils.h
//  BQCore
//
//  Created by 潘 巍 on 14-3-24.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BQViewOperateModel;
@class ASIHTTPRequest;

@interface WebUtils : NSObject

/*
 *  发出同步请求
 */
+ (BQViewOperateModel*) invokeSyncRequest:(NSString*)urlString;
+ (BQViewOperateModel*) invokeSyncRequest:(NSString*)urlString timeout:(int)seconds;
+ (BQViewOperateModel*) invokeSyncRequest:(NSString*)urlString withPostData:(NSString*)data;
+ (BQViewOperateModel*) invokeSyncRequest:(NSString*)urlString withPostData:(NSString*)data timeout:(int)seconds;

/*
 *  发出异步请求
 */
+ (ASIHTTPRequest*) invokeAsyncRequest:(NSString*)urlString withDidFinishSelector:(SEL)finishSelector withDidFailSelector:(SEL)failSelector;
+ (ASIHTTPRequest*) invokeAsyncRequest:(NSString*)urlString withDidFinishSelector:(SEL)finishSelector withDidFailSelector:(SEL)failSelector timeout:(int)seconds;
+ (ASIHTTPRequest*) invokeAsyncRequest:(NSString*)urlString withPostData:(NSString*)data withDidFinishSelector:(SEL)finishSelector withDidFailSelector:(SEL)failSelector;
+ (ASIHTTPRequest*) invokeAsyncRequest:(NSString*)urlString withPostData:(NSString*)data withDidFinishSelector:(SEL)finishSelector withDidFailSelector:(SEL)failSelector timeout:(int)seconds;

/*
 *  取消异步请求
 */
+ (void) cancelAsyncRequest:(ASIHTTPRequest*)req;

@end



/*
 *  异步请求代理协议
 */
@protocol BQAsyncRequestDelegate <NSObject>

// 请求结束，获取Response数据
- (void)requestFinished:(ASIHTTPRequest*)req;

// 请求失败，获取error数据
- (void)requestFailed:(ASIHTTPRequest*)req;


@end
