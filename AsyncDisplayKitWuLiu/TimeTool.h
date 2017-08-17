//
//  TimeTool.h
//  HuaMao
//
//  Created by ZZCN77 on 2017/7/20.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeTool : NSObject
+ (NSString *)shijianchuodate:(NSString *)string staus:(NSString *)status;
+ (NSString *)shijianchuotime:(NSString *)string;
+ (NSString *)shijianchuodate:(NSString *)string;
+ (NSString *)dayCount:(NSString *)endStr beginStr:(NSString *)beginStr;

@end
