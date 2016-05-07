//
//  DYButton.m
//  DouYu
//
//  Created by wenzhiji on 16/4/8.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYButton.h"

@implementation DYButton
// 取消高亮状态
- (void)setHighlighted:(BOOL)highlighted
{
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat buttonImageViewWH = 30.f;
    CGFloat buttonImageViewY = 5.f;
    self.imageView.width = buttonImageViewWH;
    self.imageView.height = buttonImageViewWH;
    self.imageView.centerX = self.width * 0.5;
    self.imageView.y = buttonImageViewY;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.titleLabel sizeToFit];
//    self.titleLabel.width = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}].width;
//    self.titleLabel.height = 14;
    self.titleLabel.centerX = self.width * 0.5;
    self.titleLabel.y = self.height - self.titleLabel.height;
}
@end
