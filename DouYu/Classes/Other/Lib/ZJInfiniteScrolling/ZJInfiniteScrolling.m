//
//  ZJInfiniteScrolling.m
//  ZJInfiniteScrolling
//
//  Created by wenzhiji on 16/4/22.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "ZJInfiniteScrolling.h"
#import "UIImageView+WebCache.h"
#import "DYCommendItem.h"

/************************ ZJInfiniteScrollingBegin *****************************/
#pragma mark - ZJCollectionCell
@interface ZJCollectionViewCell : UICollectionViewCell
/** image*/
/** <#name#>*/

@property (weak, nonatomic)  UIImageView *imageView;
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIPageControl *pageControl;
@end
@implementation ZJCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupAllChildView];
    }
    return self;
}
- (void)setupAllChildView
{
    // 显示图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    // contentView
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    contentView.frame = CGRectMake(0, 160, self.width, 40);
    [self.contentView addSubview:contentView];
    // 显示文本
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, contentView.width, contentView.height);
//    label.backgroundColor = [UIColor ];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"dfdsfj;j";
    [contentView addSubview:label];
    self.label = label;
//    // 显示页码
//    UIPageControl *pageControl = [[UIPageControl alloc] init];
//    pageControl.frame = CGRectMake(contentView.width * 0.6, 0, contentView.width * 0.4, contentView.height);
//    pageControl.numberOfPages = 4;
//    [contentView addSubview:pageControl];

}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}
@end
/************************ ZJInfiniteScrollingEnd *****************************/

#pragma mark - ZJInfiniteScrolling
/************************ ZJInfiniteScrollingBegin *****************************/
@interface ZJInfiniteScrolling ()<UICollectionViewDataSource,UICollectionViewDelegate>

/** collectionView*/
@property (weak, nonatomic) UICollectionView *collectionView;
/** 定时器*/
@property (weak, nonatomic) NSTimer *timer;
@end

@implementation ZJInfiniteScrolling
static NSString *ID = @"collectionViewCell";
//static NSInteger itemCount = 10;
#define itemCount 10 * self.items.count
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCollectionView];
    }
    return self;
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    // 显示中间的cell
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:itemCount / 2 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    });
    // 开启定时器
    [self startTimer];

}
/**
 *  开启定时器
 */
- (void)startTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    // 将定时器加到runloop中
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}
- (void)nextPage
{
    CGPoint offset = self.collectionView.contentOffset;
    offset.x += self.collectionView.frame.size.width;
    [self.collectionView setContentOffset:offset animated:YES];
}
/**
 *  停止定时器
 */
- (void)stopTimer
{
    [self.timer invalidate];
}
/**
 *   添加collectionView
 */
- (void)setupCollectionView
{
    // 布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    // 添加collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 200) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self addSubview:collectionView];
    collectionView.pagingEnabled = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    [collectionView registerClass:[ZJCollectionViewCell class] forCellWithReuseIdentifier:ID];
    self.collectionView = collectionView;
    self.placeholderImage = [UIImage imageNamed:@"ZJInfiniteScrolling.bundle/placeholderImage.jpg"];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = self.bounds.size;
}
// 定位到中间
- (void)resetPosition
{
    NSInteger oldItem = self.collectionView.contentOffset.x / self.collectionView.frame.size.width;
    NSInteger newItem = (itemCount / 2) + (oldItem % self.items.count);
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:newItem inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}
#pragma mark - 数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return itemCount;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (self.items.count > 0) {
        
        DYCommendItem *item = self.items[indexPath.row % self.items.count];
//        if ([item. isKindOfClass:[UIImage class]]) {
//            cell.imageView.image = data;
//        }else if ([data isKindOfClass:[NSURL class]]){
//            [cell.imageView sd_setImageWithURL:data placeholderImage:self.placeholderImage];
//        }else{
//            cell.imageView.image = self.placeholderImage;
//            
//        }
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:item.pic_url] placeholderImage:self.placeholderImage];
        cell.label.text = item.title;
    }
    return cell;
}
#pragma mark - 代理
/**
 *  定时器调用停止移动
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    [self resetPosition];
}
/**
 *  手动停止移动
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self resetPosition];
}
/**
 *  即将开始手动拖拽
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView  
{
    [self stopTimer];
}
/**
 *  停止拖拽
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(infiniteScrolling:didClickImageAtIndex:)]) {
        [self.delegate infiniteScrolling:self didClickImageAtIndex:indexPath.row % self.items.count];
    }
}
/************************ ZJInfiniteScrollingEnd *****************************/

@end

