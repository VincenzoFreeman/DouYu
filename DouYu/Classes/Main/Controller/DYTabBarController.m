//
//  DYTabBarController.m
//  DouYu
//
//  Created by wenzhiji on 16/4/8.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYTabBarController.h"
#import "DYHomePageViewController.h"
#import "DYDirectSeedingViewController.h"
#import "DYAttentionViewController.h"
#import "DYMienViewController.h"
#import "DYTabBar.h"
#import "DYNavigationController.h"
@interface DYTabBarController ()<DYTabBarDelegate>
@property (strong, nonatomic) NSMutableArray *itemArray;
@end

@implementation DYTabBarController
- (NSMutableArray *)itemArray
{
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加所有子控制器
    [self setupAllChildViewController];
    
    // 替换系统的tabBar
    DYTabBar *tabBar = [[DYTabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.delegate = self;
    tabBar.itemArray = self.itemArray;
//    tabBar.tintColor = [UIColor whiteColor];
//    self.tabBar.tintColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:tabBar];
}
#pragma mark - 在view即将显示时移除tabBar系统的子控件
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[DYTabBar class]]) {
            [view removeFromSuperview];
        }
    }
}
#pragma mark - 添加所有子控制器
- (void)setupAllChildViewController
{
    // 首页
    DYHomePageViewController *homePageViewC = [[DYHomePageViewController alloc] init];
    // 添加tabBar标题
    [self addOneChild:homePageViewC AndTitle:@"首页" AndImage:[UIImage imageNamed:@"btn_home_normal"] AndSelctedImage:[UIImage imageWithoriginalImageName:@"btn_home_selected"]];
    
    // 直播
    DYDirectSeedingViewController *directSeedingViewC = [[DYDirectSeedingViewController alloc] init];

    [self addOneChild:directSeedingViewC AndTitle:@"直播" AndImage:[UIImage imageNamed:@"btn_column_normal"] AndSelctedImage:[UIImage imageWithoriginalImageName: @"btn_column_selected"]];
    // 关注
    DYAttentionViewController *AttentionViewC = [[DYAttentionViewController alloc] init];
    [self addOneChild:AttentionViewC AndTitle:@"关注" AndImage:[UIImage imageNamed:@"btn_live_normal"] AndSelctedImage:[UIImage imageWithoriginalImageName: @"btn_live_selected"]];
//    // 我的
    DYMienViewController *mineViewC = [[DYMienViewController alloc] init];
    [self addOneChild:mineViewC AndTitle: @"我的" AndImage:[UIImage imageNamed:@"btn_user_normal"] AndSelctedImage:[UIImage imageWithoriginalImageName: @"btn_user_selected"]];
}

- (void)addOneChild:(UIViewController *)ViewC AndTitle:(NSString *)title AndImage:(UIImage *)image AndSelctedImage:(UIImage *)selectedImage
{
    ViewC.tabBarItem.title = title;
    ViewC.tabBarItem.image = image;
    ViewC.tabBarItem.selectedImage = selectedImage;
    // 将tabBarItem添加到数组
    [self.itemArray addObject:ViewC.tabBarItem];
    // 判断是否是我的控制器
    if  ([ViewC isKindOfClass:[DYMienViewController class]])
    {
        [self addChildViewController:ViewC];
        return;
    }
    // 如果不是就包装成导航
    DYNavigationController *navigationController = [[DYNavigationController alloc] initWithRootViewController:ViewC];
    
    
    [self addChildViewController:navigationController];
   
}
#pragma mark - DYTabBarDelegate
- (void)tabBar:(DYTabBar *)tabBar clickSelectedButtonIndex:(NSInteger)index
{
    self.selectedIndex = index;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
