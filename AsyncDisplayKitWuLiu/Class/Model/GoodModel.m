//
//  GoodModel.m
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/15.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "GoodModel.h"

@implementation GoodModel
- (NSMutableArray *)productImageArray{
    if (_productImageArray == nil) {
        _productImageArray = [[NSMutableArray alloc] init];
    }
    return _productImageArray;
}

@end
