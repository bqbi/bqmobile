//
//  FSUtils.h
//  BQCore
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FSUtils : NSObject


//  获得文档路径
+ (NSString*) getDocPath;
+ (NSString*) getDocPath:(NSString*)relativePath;

//  获得资源路径
+ (NSString*) getResourcePath;
+ (NSString*) getResourcePath:(NSString*)relativePath;
+ (NSString*) getResourcePath:(NSString*)bundleName withRelativePath:(NSString*)relativePath;

/*
 *  获得临时文件路径
 *  autoCreate - 自动创建
 */
+ (NSString*) getTempPath:(BOOL)autoCreate;

//  清空临时文件夹
+ (void) clearTempDirectory;

/*
 *  创建一个目录
 *  dirPath - 目录路径
 */
+ (void) createDirectory:(NSString*)dirPath;

/*
 *  读取文件
 *  path - 文件路径
 *
 */
+ (NSString*) readFile:(NSString*) path;

/*
 *  写属性文件
 *  dic - 字典类型对象
 *  path - 路径
 *
 */
+ (void) writePropertyFile:(NSMutableDictionary*)dic forPath:(NSString*)path;

/*
 *  清空目录下得所有文件
 *  dirPath - 目录路径
 *
 */
+ (void) clearDirectory:(NSString*) dirPath;

/*
 *  加载图片，如果是自定义的从skin目录获取，否则从皮肤中获取，最后从基础库中获取
 *  name - 图片名称
 *
 */
+ (UIImage*) loadImage:(NSString*) name;

@end
