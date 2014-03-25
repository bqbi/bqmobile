//
//  BQLoadView.m
//  BQMobile
//
//  Created by 潘 巍 on 14-3-19.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQLoadView.h"
#import <QuartzCore/CALayer.h>

@implementation BQLoadView

@synthesize indicatorView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.8;
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 0;
        self.layer.borderColor = [[UIColor clearColor] CGColor];
        
        self.indicatorView = [[UIActivityIndicatorView alloc] init];
        self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        self.hidden = YES;
        [self addSubview:self.indicatorView];
    }
    return self;
}

- (void)changeLocation {
    CGFloat width = 30.0f;
    self.indicatorView.frame = CGRectMake((self.frame.size.width-width)/2, 20, width, width);
}

- (void)showLoadView {
    self.hidden = NO;
    [self changeLocation];
    [self.indicatorView startAnimating];
}

- (void)hideLoadView {
    self.hidden = NO;
    [self.indicatorView stopAnimating];
}


@end
