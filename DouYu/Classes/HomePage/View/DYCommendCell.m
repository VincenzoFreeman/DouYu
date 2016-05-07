//
//  DYCommendCell.m
//  DouYu
//
//  Created by wenzhiji on 16/5/7.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYCommendCell.h"


@interface DYCommendCell ()<UICollectionViewDataSource>
@property(weak, nonatomic) UICollectionView *collectionView;

@end
@implementation DYCommendCell
static NSString *ID = @"cell";

- (UICollectionView *)collectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.width * 0.5, self.height * 0.5);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    //- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
    [self.contentView addSubview:collectionView];
    
    self.collectionView = collectionView;
    return collectionView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.collectionView.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    return cell;
}
@end
