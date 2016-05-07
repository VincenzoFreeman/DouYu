//
//  DYScanQRCodeTool.h
//  DouYu
//
//  Created by wenzhiji on 16/5/7.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
@interface DYScanQRCodeTool : NSObject
single_interface(DYScanQRCodeTool)
// 设置是否需要描绘二维码边框
@property (nonatomic, assign) BOOL isDrawQRCodeRect;

// 开始扫描
- (void)beginScanInView:(UIView *)view result:(void(^)(NSArray<NSString *> *resultStrs))resultBlock;

// 停止扫描
- (void)stopScan;

// 设置兴趣点
- (void)setInsteretRect:(CGRect)originRect;


@end
