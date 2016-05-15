//
//  DYCommendItem.h
//  DouYu
//
//  Created by wenzhiji on 16/5/11.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYCommendItem : NSObject
/** */
@property (strong, nonatomic) NSString *id;
/** 名称*/
@property (strong, nonatomic) NSString *title;
/** 图片url*/
@property (strong, nonatomic) NSString *pic_url;
/** 数组*/
@property (strong, nonatomic) NSArray *room;


/** 图片个数,方便开发*/
@property (assign, nonatomic) NSInteger imageCount;
+ (instancetype)commendWithDict:(NSDictionary *)dict;
@end
