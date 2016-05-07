//
//  UIView+frame.m
//  彩票
//
//  Created by wenzhiji on 16/3/5.
//  Copyright © 2016年 wenzhiji. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (CGFloat)width
{
    return self.frame.size.width;
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
@end
