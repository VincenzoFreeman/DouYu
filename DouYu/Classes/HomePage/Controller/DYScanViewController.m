//
//  DYScanViewController.m
//  DouYu
//
//  Created by wenzhiji on 16/5/7.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYScanViewController.h"
#import "DYScanQRCodeTool.h"
@interface DYScanViewController ()
@property (weak, nonatomic) IBOutlet UIView *scanBackView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toBottom;

@end

@implementation DYScanViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor blackColor]];
    self.title = @"扫描二维码";
    
}
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
+ (instancetype)scanViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass(self) bundle:nil];
    return [storyboard instantiateInitialViewController];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self beginScan];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self beginScanAnimation];
}



// 开始扫描
- (void)beginScan
{
    
    [DYScanQRCodeTool sharedDYScanQRCodeTool].isDrawQRCodeRect = YES;
    [[DYScanQRCodeTool sharedDYScanQRCodeTool] setInsteretRect:self.scanBackView.frame];
    [[DYScanQRCodeTool sharedDYScanQRCodeTool] beginScanInView:self.view result:^(NSArray<NSString *> *resultStrs) {
        NSLog(@"%@", resultStrs);
        [[DYScanQRCodeTool sharedDYScanQRCodeTool] stopScan];
        
    }];
    
    
    
}



// 开始扫描动画
- (void)beginScanAnimation
{
    self.toBottom.constant = self.scanBackView.frame.size.height;
    [self.view layoutIfNeeded];
    
    
    [UIView animateWithDuration:2 animations:^{
        [UIView setAnimationRepeatCount:CGFLOAT_MAX];
        self.toBottom.constant = - self.scanBackView.frame.size.height;
        [self.view layoutIfNeeded];
        
    }];
    
    
}


@end
