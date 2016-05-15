//
//  DYAutoScrollCell.m
//  DouYu
//
//  Created by wenzhiji on 16/5/11.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYAutoScrollCell.h"

@interface DYAutoScrollCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *title_Label;

@end
@implementation DYAutoScrollCell
- (void)setItem:(DYCommendItem *)item
{
    _item = item;
    
}
- (void)awakeFromNib {
    // Initialization code
}
- (void)createPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    pageControl.center = CGPointMake(self.frame.size.width-50, self.frame.size.height-10);
    pageControl.numberOfPages = 0;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}

@end
