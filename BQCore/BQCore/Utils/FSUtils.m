//
//  FSUtils.m
//  BQCore
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//
#import "FSUtils.h"

#import "Common.h"
#import "BQContext.h"

@implementation FSUtils

//  获得文档路径
+ (NSString*) getDocPath {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString*) getDocPath:(NSString*)relativePath {
    return [NSString stringWithFormat:@"%@/%@", [self getDocPath], relativePath];
}

//  获得资源路径
+ (NSString*) getResourcePath {
    return [[NSBundle mainBundle] resourcePath];
}

+ (NSString*) getResourcePath:(NSString*)relativePath {
    return [NSString stringWithFormat:@"%@/%@", [self getResourcePath], relativePath];
}

+ (NSString*) getResourcePath:(NSString*)bundleName withRelativePath:(NSString*)relativePath {
    return [NSString stringWithFormat:@"%@/%@.bundle/%@", [self getResourcePath], bundleName, relativePath];
}

/*
 *  获得临时文件路径
 *  autoCreate - 自动创建
 */
+ (NSString*) getTempPath:(BOOL)autoCreate {
    NSString* tempPath = [NSString stringWithFormat:@"%@/Temp", [self getDocPath]];
    
    if (autoCreate) {
        [self createDirectory:tempPath];
    }
    
    return tempPath;
}

//  清空临时文件夹
+ (void) clearTempDirectory {
    NSString* tempPath = [FSUtils getTempPath:NO];
    [FSUtils clearDirectory:tempPath];
}

/*
 *  读取文件
 *  path - 文件路径
 *
 */
+ (NSString*) readFile:(NSString*) path {
    NSString* data = nil;
    NSData* reader = [NSData dataWithContentsOfFile:path];
    if (reader) {
        data = [[NSString alloc] initWithData:reader encoding:NSUTF8StringEncoding];
    }
    return data;
}

/*
 *  写属性文件
 *  dic - 字典类型对象
 *  path - 路径
 *
 */
+ (void) writePropertyFile:(NSMutableDictionary*)dic forPath:(NSString*)path {
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    if (dic) {
        NSEnumerator* enumerator = [dic objectEnumerator];
        NSString* key;
        while (key = [enumerator nextObject]) {
            [arr addObject:[NSString stringWithFormat:@"%@=%@", key, [dic objectForKey:key]]];
        }
        [arr writeToFile:path atomically:YES];
    }
    
}

/*
 *  创建一个目录
 *  dirPath - 目录路径
 */
+ (void) createDirectory:(NSString*)dirPath {
    [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
}

/*
 *  清空目录下得所有文件
 *  dirPath - 目录路径
 *
 */
+ (void) clearDirectory:(NSString*) dirPath {
    NSFileManager* fileMan = [NSFileManager defaultManager];
    NSArray* files = [fileMan contentsOfDirectoryAtPath:dirPath error:nil];
    if (files) {
        NSString* filePath;
        for (int i = 0; i < [files count]; i++) {
            filePath = [NSString stringWithFormat:@"%@/%@", dirPath, [files objectAtIndex:i]];
            [fileMan removeItemAtPath:filePath error:nil];
        }
    }
    
}

/*
 *  加载图片，
 *  如果主题样式是自定义的从skin目录获取，
 *  否则从皮肤的Style.bundle目录中获取，
 *  最后从基础库中获取
 *  name - 图片名称
 *
 */
+ (UIImage*) loadImage:(NSString*) name {
    NSString* style = [BQContext getGlobalStyle];
    
    UIImage* image = nil;
    if (style) {
        if ([style isEqualToString:ROOT_VIEW_STYLE_CUSTOM]) {
            NSString* path = [NSString stringWithFormat:@"%@/skin/%@",[FSUtils getDocPath], name];
            image = [UIImage imageWithContentsOfFile:path];
        } else {
            NSString* path = [NSString stringWithFormat:@"Style.bundle/%@/%@",style, name];
            image = [UIImage imageNamed:path];
        }
    }
    
    return image;
}

@end
