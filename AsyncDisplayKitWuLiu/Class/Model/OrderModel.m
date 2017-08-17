//
//  OrderModel.m
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/15.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

- (NSMutableArray *)goodArray{
    if (_goodArray == nil) {
        self.goodArray = [[NSMutableArray alloc] init];
    }
    return _goodArray;
}

@end
