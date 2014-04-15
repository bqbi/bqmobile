//
//  BQCOMCompositionResolver.m
//  BQMobile
//
//  Created by 潘 巍 on 14-4-9.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQCOMCompositionResolver.h"

@implementation BQCOMCompositionResolver

+ (id) createComponentView:(GDataXMLElement*)el withParentView:(UIView*)parentView withRelativePath:(NSString*)relPath {
    UIScrollView* view = [[UIScrollView alloc] initWithFrame:parentView.bounds];
    
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    [parentView addSubview:view];
    
    return view;
}



@end
