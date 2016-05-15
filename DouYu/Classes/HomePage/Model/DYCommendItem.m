//
//  DYCommendItem.m
//  DouYu
//
//  Created by wenzhiji on 16/5/11.
//  Copyright © 2016年 Manager. All rights reserved.
//

#import "DYCommendItem.h"

@implementation DYCommendItem
+ (instancetype)commendWithDict:(NSDictionary *)dict
{
    DYCommendItem *item = [[DYCommendItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
@end
