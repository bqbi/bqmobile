//
//  BQImageTextView.m
//  BQMobile
//
//  Created by mac on 2014-02-26.
//  Copyright (c) 2014年 yonyou. All rights reserved.
//

#import "BQImageTextView.h"

@implementation BQImageTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        _text = [[UITextField alloc] initWithFrame:frame];
    }
    return self;
}


- (id) initWithFrame:(CGRect)frame andHeaderImage:(UIImage*)image
{
    self = [self initWithFrame:frame];
    if (self)
    {
        //
        _image = image;
    }
    return self;
}
//
//- (void) layoutSubviews
//{
//    [super layoutSubviews];
//    CGRect rect = self.frame;
//    rect.origin.x += rect.size.height;
//    
//    _text.center = CGPointMake(rect.origin.x+rect.size.width/2.0, rect.origin.y+rect.size.height/2.0);
//}

//- (void) drawRect:(CGRect)rect
//{
////    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
//    CGRect rectImage = self.frame;
//    rectImage.size.width = rectImage.size.height;
//    CGRectInset(rectImage, rectImage.size.height/4.0, rectImage.size.height/4.0);
//    if (!_image)
//    {
//        [super drawRect:rect];
//        
//        [[UIColor redColor] set];  //设置线的颜色
//        
//        CGContextRef curenContext = UIGraphicsGetCurrentContext();  //创建一块画布
//        
//        CGContextSetRGBStrokeColor(curenContext, 0 ,0 ,0 ,0);
//        
//        CGContextSetLineWidth(curenContext, 1.0);//设置线的宽度
//        
//        CGContextMoveToPoint(curenContext, rectImage.origin.x, rectImage.origin.y);  //设置线的起点
//        
//        CGContextAddLineToPoint(curenContext, rectImage.origin.x+rectImage.size.width, rectImage.origin.y+rectImage.size.height);//设置线的终点
//        
//        CGContextAddLineToPoint(curenContext, rectImage.origin.x, rectImage.origin.y+rectImage.size.height);//设置线的终点
//        CGContextAddLineToPoint(curenContext, rectImage.origin.x+rectImage.size.width, rectImage.origin.y);//设置线的终点
//        
//        
//        
////        CGContextAddLineToPoint(curenContext, 200.0f,200.0f);
////
////        CGContextSetLineCap(curenContext, kCGLineCapSquare);
//        
//        CGContextStrokePath(curenContext); //添加路径
//        
//    }
//}



@end
