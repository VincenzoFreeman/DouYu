//
//  DYTabBar.h
//  DouYu
//
//  Created by wenzhiji on 16/4/8.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYTabBar;
@protocol DYTabBarDelegate <NSObject>

- (void)tabBar:(DYTabBar *)tabBar clickSelectedButtonIndex:(NSInteger)index;

@end

@interface DYTabBar : UIView
@property (strong, nonatomic) NSArray *itemArray;
@property (weak, nonatomic)id<DYTabBarDelegate> delegate;
@end
