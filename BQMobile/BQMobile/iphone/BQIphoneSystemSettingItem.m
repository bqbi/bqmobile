//
//  BQItemView.m
//  CustomItemView
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 QZ. All rights reserved.
//

#import "BQIphoneSystemSettingItem.h"

@interface BQIphoneSystemSettingItem ()

@property (nonatomic, retain) UIView * leftView;
@property (nonatomic, retain) UIView * rightView;

@end
@implementation BQIphoneSystemSettingItem

- (id) initWithFrame:(CGRect)frame andLeftView:(UIView*) lv andRightView:(UIView*) rv
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _leftView = lv;
        _rightView = rv;
        [self addSubview:_leftView];
        [self addSubview:_rightView];
        _leftView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    }
    return self;
}


- (void)layoutSubviews
{
    NSLog(@"layoutSubviews");
    CGRect rect = self.frame;
    rect.origin.x = rect.origin.y = 0;
    CGRect lrect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width / 2.0, rect.size.height);
//    CGRect rrect = CGRectMake(rect.origin.x+rect.size.width / 2.0, rect.origin.y, rect.size.width / 2.0, rect.size.height);
    CGRect rrect = CGRectMake(rect.size.width - 80-4, rect.origin.y+2, rect.size.width / 2.0, rect.size.height);

    lrect.origin.x += 4;
    lrect.origin.y += 4;
    lrect.size.width -= 8;
    lrect.size.height -= 8;
    rrect.origin.x += 4;
    rrect.origin.y += 4;
    rrect.size.width -= 8;
    rrect.size.height -= 8;
    //
    self.leftView.frame = lrect;
    self.rightView.frame = rrect;
}
@end
