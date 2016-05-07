//
//  DYMienViewController.m
//  DouYu
//
//  Created by wenzhiji on 16/4/8.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYMienViewController.h"
#import "DYbackgroundView.h"
#import "DYLoginViewController.h"
#import "DYNavigationController.h"
@interface DYMienViewController ()
@property (weak, nonatomic) UIView *backgroundView;

@end

@implementation DYMienViewController
- (instancetype)init
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil];
    return [storyboard instantiateInitialViewController];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 10;
//    self.tableView.alwaysBounceVertical = NO;
    self.view.backgroundColor = ZJColor(245.f, 245.f, 245.f);
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.width, 120)];
//    headerView.backgroundColor = ZJRandomColor;
    self.tableView.tableHeaderView = headerView;
   
    self.backgroundView = headerView;
   // 添加背景view
    [self setupBackgroundView];
}
- (void)setupBackgroundView
{
    // 添加点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.backgroundView addGestureRecognizer:tap];
    DYbackgroundView *backgroundView = [DYbackgroundView backgroundView];
    backgroundView.frame = self.backgroundView.bounds;
    [self.backgroundView addSubview:backgroundView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tap
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"DYLoginViewController" bundle:nil];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    [self presentViewController:viewController animated:YES completion:nil];
}
#pragma mark - Table view data source

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:; forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
