//
//  DYCommendViewController.m
//  DouYu
//
//  Created by wenzhiji on 16/4/17.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYCommendViewController.h"
#import "DYCommendCell.h"
#import "AutoScrollView.h"
#import "DYAutoScrollCell.h"
#import "ZJInfiniteScrolling.h"
#import "DYHTTPTool.h"
#import <MJExtension/MJExtension.h>
#import "DYCommendItem.h"
#define CommendURL @"http://capi.douyucdn.cn/api/v1/slide/6?aid=ios&client_sys=ios&time=1462612440&version=2.22&auth=34899296eeaa1921096f8be2ef216423"
#define titleViewH 70
@interface DYCommendViewController ()<ZJInfiniteScrollingDelegate>
@property (weak, nonatomic) NSTimer *timer;
@property (weak, nonatomic) UICollectionView *collectionView;
 /** 模型数组*/
@property (strong, nonatomic) NSArray *dataArray;
@end

@implementation DYCommendViewController
//- (void)loadView
//{
//    }
static NSString *cellID = @"cell";
// collectionView 
static NSString *cellId = @"autoScrollCell";
- (NSArray *)dataArray
{
    if (_dataArray == nil) {
//        NSMutableArray *array = [[NSMutableArray alloc] init];///////////
        _dataArray = [NSArray array];
        [self loadData];
        
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
    [self.tableView registerClass:[DYCommendCell class] forCellReuseIdentifier:cellID];
}
- (void)loadData
{
    [DYHTTPTool get:CommendURL params:nil success:^(id responseObj) {
       NSArray *tempArray = responseObj[@"data"];
        // 字典数组转模型数组
       NSMutableArray * dataArray = [DYCommendItem mj_objectArrayWithKeyValuesArray:tempArray];

        // 刷新列表
        self.dataArray = dataArray;
        [self.tableView reloadData];
        // 添加headerView
        [self setupHeaderView];

    } failure:nil];
       
    
}
/**
 *  添加headerView
 */
- (void)setupHeaderView
{
//    [self loadData];
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, ZJScreenW, 270);
    headerView.backgroundColor = [UIColor redColor];
    
    self.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
        // 添加headerView
    
    self.tableView.tableHeaderView = headerView;
    ZJInfiniteScrolling *scrollView = [[ZJInfiniteScrolling  alloc] init];
    scrollView.items = self.dataArray;
    scrollView.imageCount = self.dataArray.count;
    scrollView.delegate = self;
    scrollView.frame = CGRectMake(0, 0,headerView.width, headerView.height - titleViewH);
    [headerView addSubview:scrollView];
    // 添加标题
    UIScrollView *titleScrollView = [[UIScrollView alloc] init];
    titleScrollView.frame = CGRectMake(0, 200, headerView.width, titleViewH);
    titleScrollView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:titleScrollView];
}
#pragma mark - tableview代理数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    DYCommendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
    
}
#pragma mark - ZJInfiniteScrollingDelegate
- (void)infiniteScrolling:(ZJInfiniteScrolling *)inginiteScrolling didClickImageAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%zd张图片",index);
}

@end
