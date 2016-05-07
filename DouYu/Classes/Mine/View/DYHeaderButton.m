//
//  DYHeaderButton.m
//  DouYu
//
//  Created by wenzhiji on 16/4/10.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYHeaderButton.h"

@implementation DYHeaderButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat buttonImageViewWH = 40.f;
    CGFloat buttonImageViewY = 5.f;
    self.imageView.width = buttonImageViewWH;
    self.imageView.height = buttonImageViewWH;
    self.imageView.centerX = self.width * 0.5f;
    self.imageView.y = buttonImageViewY;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
//    self.titleLabel.textColor = [UIColor blackColor];
    [self.titleLabel sizeToFit];
////    self.titleLabel.width = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}].width;
//    //    self.titleLabel.height = 14;
    self.titleLabel.centerX = self.imageView.centerX;
    self.titleLabel.y = self.height - self.titleLabel.height - 5;
    
}


@end
