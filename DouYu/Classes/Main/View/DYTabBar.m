//
//  DYTabBar.m
//  DouYu
//
//  Created by wenzhiji on 16/4/8.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYTabBar.h"
#import "DYButton.h"

@interface DYTabBar()
@property (weak, nonatomic)UIButton *preivceSelectedButton;
@end
@implementation DYTabBar
- (void)setItemArray:(NSArray *)itemArray
{
   
    _itemArray = itemArray;
    NSInteger count = itemArray.count;
    // 创建按钮
    for (int i = 0; i < count; i++) {
        DYButton *button = [[DYButton alloc] init];
        // 取出数组模型
        UITabBarItem *item = self.itemArray[i];
        
        [button setTitle:item.title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [button setImage:item.image forState:UIControlStateNormal];
        [button setImage:item.selectedImage forState:UIControlStateSelected];
        [self addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        if (i == 0) {
            [self buttonClick:button];
        }
    }

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    NSInteger buttonX = 0;
    NSInteger buttonY = 0;
    CGFloat buttonW = self.width / count;
    CGFloat buttonH = self.height;

    for (int i = 0; i < count; i++) {
        buttonX = i * buttonW;
        DYButton *button = self.subviews[i];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
    

}

- (void)buttonClick:(UIButton *)button
{
    self.preivceSelectedButton.selected = NO;
    button.selected = YES;
    self.preivceSelectedButton = button;
    // 点击了按钮就调用代理方法
    if ([self.delegate respondsToSelector:@selector(tabBar:clickSelectedButtonIndex:)]) {
        [self.delegate tabBar:self clickSelectedButtonIndex:button.tag];
    }
    
}
@end
