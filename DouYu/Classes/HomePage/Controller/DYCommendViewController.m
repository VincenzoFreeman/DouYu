//
//  DYCommendViewController.m
//  DouYu
//
//  Created by wenzhiji on 16/4/17.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYCommendViewController.h"
#import "DYCommendCell.h"
@interface DYCommendViewController ()

@end

@implementation DYCommendViewController
static NSString *cellID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
//    [self.tableView registerClass:[DYCommendCell class] forCellReuseIdentifier:cellID];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    // 添加headerView
}
#pragma mark - tableview代理数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    DYCommendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    UITableViewCell *cell = [[DYCommendCell alloc] init];
    cell.backgroundColor = [UIColor lightGrayColor];
    NSLog(@"%@",NSStringFromCGRect(cell.frame));
    return cell;
    
}
@end
