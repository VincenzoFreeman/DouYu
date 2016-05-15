//
//  DYHomePageViewController.m
//  DouYu
//
//  Created by wenzhiji on 16/4/8.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYHomePageViewController.h"
#import "DYTitleButton.h"
#import "DYCommendViewController.h"
#import "DYGameViewController.h"
#import "DYAmusementViewController.h"
#import "DYOddballController.h"
#import "DYNaviButton.h"
#import "DYScanViewController.h"

@interface DYHomePageViewController ()<UIScrollViewDelegate>
@property (weak,nonatomic)UIView *titleView;
@property (weak, nonatomic)UIScrollView *scrollView;
@property (weak, nonatomic)DYTitleButton *previousSelectedTitleButton;
@property (weak, nonatomic)UIView *underlineView;
@end

@implementation DYHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZJColor(215, 215, 215);
    // 添加子控制器
    [self setupAllChildViewController];
    // 添加scrollView
    [self setupScrollView];
    // 添加titleView
    [self setupTitleView];
    // 添加导航条内容
    [self setupNavigatioBarContent];
    // 添加header
    
}
/**
 *  添加导航条内容
 */
- (void)setupNavigatioBarContent
{
   
    UIView *contentView = [[UIView alloc] init];
    CGFloat contentViewW = ZJScreenW * 0.5;
    CGFloat contentViewH = ZJNaviH;
    contentView.frame = CGRectMake(ZJScreenW * 0.5, 20, contentViewW - 20, contentViewH);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    // 扫描按钮
    [self addAllNavigationButton:[UIImage imageNamed:@"Image_scan"] highlightImage:[UIImage imageNamed:@"Image_scan_click"] contentView:contentView];
    // 搜索按钮
    [self addAllNavigationButton:[UIImage imageNamed:@"btn_search"] highlightImage:[UIImage imageNamed:@"btn_search_clicked"] contentView:contentView];
    // 历史按钮
    [self addAllNavigationButton:[UIImage imageNamed:@"image_my_history"] highlightImage:[UIImage imageNamed:@"Image_my_history_click"] contentView:contentView];

}
/**
 *  添加导航条上的按钮
 */
- (void)addAllNavigationButton:(UIImage *)image highlightImage:(UIImage *)highlightImage contentView:(UIView *)contentView
{
    static NSInteger i = 0;
    DYNaviButton *button = [DYNaviButton buttonWithType:UIButtonTypeCustom];
    button.tag = i;
    button.x = i * (contentView.width / 3);
    button.y = 0;
    button.width = contentView.width / 3;
    button.height = contentView.height;
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(naviButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button];
    i++;
    
}
#pragma mark - 处理导航条按钮逻辑
- (void)naviButtonClick:(DYNaviButton *)button
{
    switch (button.tag) {
        case 0:{// 扫描二维码
        // 添加扫描控制器
            [self setupScanQRCodeViewController];
            break;
        }
        case 1:{// 搜索
            NSLog(@"点击了搜索");
            break;
        }
        case 2:{// 历史记录
            NSLog(@"点击了历史记录按钮");
            break;
        }

        default:
            break;
    }
}
- (void)setupScanQRCodeViewController{
    
    DYScanViewController *scanViewC = [DYScanViewController scanViewController];
    // 包装导航条
    UINavigationController *navigationC = [[UINavigationController alloc] initWithRootViewController:scanViewC];
    navigationC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:navigationC animated:YES completion:nil];
}
/**
 *  添加所有子控制器
 */
- (void)setupAllChildViewController
{
    // 推荐
    [self addChildViewController:[[DYCommendViewController alloc] init]];
    // 游戏
    [self addChildViewController:[[DYGameViewController alloc] init]];
    // 娱乐
    [self addChildViewController:[[DYAmusementViewController alloc] init]];
    // 奇葩
    [self addChildViewController:[[DYOddballController alloc] init]];
}
/**
 *  添加scrollView
 */
- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    // scrollView
    scrollView.scrollsToTop = NO;
//    
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    // 添加scrollView子控件
    [self setupScrollViewSubViews];
}
- (void)setupScrollViewSubViews
{
    NSInteger count = self.childViewControllers.count;
       // 设置滚动范围
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width * count, 0);
    // 开启分页
    self.scrollView.pagingEnabled = YES;
    // 关闭scrollView滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
}
/**
 *   添加titleView
 */
- (void)setupTitleView
{
    UIView *titView = [[UIView alloc] init];
    titView.frame = CGRectMake(0, 64, ZJScreenW, 44);
    titView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titView];
    self.titleView = titView;
    // 添加标题按钮
    [self setupTitleButton];
    // 添加下滑线
    [self setupUnderline];
}
/**
 *  添加下滑线
 */
- (void)setupUnderline
{
    DYTitleButton *firstTitleButton = self.titleView.subviews[0];
    UIView *underlineView = [[UIView alloc] init];
    underlineView.backgroundColor = [UIColor orangeColor];
    underlineView.frame = CGRectMake(0, self.titleView.height - 2, 0, 2);
//    underlineView.centerX = firstTitleButton.width * 0.5;
    // 计算下划线的宽度
//    [firstTitleButton.titleLabel sizeToFit];
    underlineView.width = firstTitleButton.width;
//    underlineView.width = [firstTitleButton.currentTitle sizeWithAttributes:@{NSFontAttributeName : firstTitleButton.titleLabel.font}].width;
    [self.titleView addSubview:underlineView];
    self.underlineView = underlineView;
}
/**
 *  添加标题按钮
 */
- (void)setupTitleButton
{
    NSArray *titleArray = @[@"推荐",@"游戏",@"娱乐",@"奇葩"];
    CGFloat buttonY = 0;
    CGFloat buttonW = self.titleView.width / titleArray.count;
    CGFloat buttonH = self.titleView.height;
    for (NSInteger i = 0; i < titleArray.count; i++) {
        DYTitleButton *titleButton = [DYTitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(i * buttonW, buttonY, buttonW, buttonH);
        [titleButton setTitle:titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        titleButton.tag = i;
        [titleButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [self.titleView addSubview:titleButton];
        [titleButton addTarget:self action:@selector(clickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) [self clickTitleButton:titleButton];
    }
}
- (void)clickTitleButton:(DYTitleButton *)button
{
    self.previousSelectedTitleButton.selected = NO;
    button.selected = YES;
     // 下划线位置
    [UIView animateWithDuration:0.25 animations:^{
        
        self.underlineView.centerX = button.width * 0.5 + button.x;
    } completion:^(BOOL finished) {
        NSInteger i = button.tag;
        CGFloat subViewX = 0;
        // 懒加载view
        UIView *subView = self.childViewControllers[i].view;
        subViewX = i * self.scrollView.width;
        subView.frame = CGRectMake(subViewX, 0, self.scrollView.width, self.scrollView.height);
        [self.scrollView addSubview:subView];
    }];
    self.previousSelectedTitleButton = button;
    // 点击按钮时移动到对应的view
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = button.tag * self.scrollView.width;
    self.scrollView.contentOffset = offset;
    
}

#pragma mark - <UIScrollViewDelegate>
/**
 *  松开手指时调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    NSLog(@"%s",__func__);
}
/**
 *  scrollView停止时调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 获得对应的标题按钮
//    NSLog(@"%s",__func__);
    NSInteger index = scrollView.contentOffset.x / self.scrollView.width;
//    NSLog(@"%zd--%f--%f",index,self.scrollView.width,scrollView.contentOffset.x);
    // 移动时改变对应的选中按钮
    DYTitleButton *selectedButton = self.titleView.subviews[index];
    [self clickTitleButton:selectedButton];
    

}

@end
