//
//  UIImage+image.m
//  彩票
//
//  Created by wenzhiji on 16/3/5.
//  Copyright © 2016年 wenzhiji. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)
+ (UIImage *)imageWithoriginalImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
