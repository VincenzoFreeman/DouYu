//
//  DYbackgroundView.m
//  DouYu
//
//  Created by wenzhiji on 16/4/15.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYbackgroundView.h"

@interface DYbackgroundView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation DYbackgroundView

+ (instancetype)backgroundView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (void)awakeFromNib
{
    UIImage *image = self.imageView.image;
    // 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO,0);
    // 设置裁剪区
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0,image.size.width, image.size.height)];
    // 裁剪
    [clipPath addClip];
    // 画图片
    [self.imageView.image drawAtPoint:CGPointZero];
    // 取出图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    self.imageView.image = image;
}
@end
