//
//  BQServerAccess.h
//  BQCore
//
//  Created by 潘 巍 on 14-3-2.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BQServerAccess : NSObject

@property (nonatomic, retain) NSString* userName;
@property (nonatomic, retain) NSString* serverUrl;
@property (nonatomic, retain) NSString* serverKey; // 离线关键字，服务器别名


- (NSString*) getCachePath:(BOOL)autoCreate;


@end