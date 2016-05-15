//
//  ZJInfiniteScrolling.h
//  ZJInfiniteScrolling
//
//  Created by wenzhiji on 16/4/22.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJInfiniteScrolling;

@protocol ZJInfiniteScrollingDelegate <NSObject>

- (void)infiniteScrolling:(ZJInfiniteScrolling *)inginiteScrolling didClickImageAtIndex:(NSInteger)index;

@end
@interface ZJInfiniteScrolling : UIView
/** 数组模型*/
@property (strong, nonatomic) NSArray *items;
/** 页码个数*/
@property (assign, nonatomic) NSInteger imageCount;
/** 占位图片*/
@property (strong, nonatomic) UIImage *placeholderImage;
/** 代理*/
@property (strong, nonatomic) id<ZJInfiniteScrollingDelegate> delegate;
@end
