//
//  OrderModel.h
//  AsyncDisplayKitWuLiu
//
//  Created by ZZCN77 on 2017/8/15.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *orderImage;
@property (nonatomic, copy) NSString *dayCount;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, strong) NSString  *kd_company;
@property (nonatomic, strong) NSString  *kd_number;
@property (nonatomic, copy) NSString *etdStr;
@property (nonatomic, copy) NSString *etaStr;
//商品数据数据源
@property (nonatomic, strong) NSMutableArray *goodArray;

@end
