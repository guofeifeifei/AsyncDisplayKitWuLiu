//
//  TimeTool.m
//  HuaMao
//
//  Created by ZZCN77 on 2017/7/20.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "TimeTool.h"

@implementation TimeTool
+ (NSString *)shijianchuodate:(NSString *)string{
    if (![string isEqual:[NSNull null]]) {
        
        
        // 格式化时间
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        formatter.timeZone = [NSTimeZone systemTimeZone];
        [formatter setDateFormat:@"YYYY-MM-dd"];
        
        // 毫秒值转化为秒
        NSDate* date = [NSDate dateWithTimeIntervalSince1970:[string doubleValue]];
        
        NSString* dateString = [formatter stringFromDate:date];
        return dateString;
    }
    return @"0";
}
+ (NSString *)shijianchuotime:(NSString *)string{
    
    
    // 格式化时间
    NSDateFormatter* formatter1 = [[NSDateFormatter alloc] init];
    formatter1.timeZone = [NSTimeZone systemTimeZone];
    [formatter1 setDateFormat:@"HH:mm:ss"];
    // 毫秒值转化为秒
    NSDate* date1 = [NSDate dateWithTimeIntervalSince1970:[string doubleValue]];
    
    NSString *timeStr = [formatter1 stringFromDate:date1];
    return timeStr;
}
+ (NSString *)dayCount:(NSString *)endStr beginStr:(NSString *)beginStr{
    //创建日期格式化对象
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    if (![endStr isEqual:[NSNull null]] && ![beginStr isEqual:[NSNull null]] ) {
        NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[endStr doubleValue]];
        
        NSDate *beginDate = [NSDate dateWithTimeIntervalSince1970:[beginStr doubleValue]];
        
        NSTimeInterval time= [endDate timeIntervalSinceDate:beginDate];
        
        int days=((int)time)/(3600*24);
        //    int hours=((int)time)%(3600*24)/3600;
        NSString *dateContent=[[NSString alloc] initWithFormat:@"%i",days];
        return dateContent;
    }
    return @"1";
}

+ (NSString *)shijianchuodate:(NSString *)string staus:(NSString *)status{
    // 格式化时间
    if (![string isEqual:[NSNull null]]) {
        
        
        NSDateFormatter* formatter1 = [[NSDateFormatter alloc] init];
        formatter1.timeZone = [NSTimeZone systemTimeZone];
        [formatter1 setDateFormat:status];
        // 毫秒值转化为秒
        NSDate* date1 = [NSDate dateWithTimeIntervalSince1970:[string doubleValue]];
        
        NSString *timeStr = [formatter1 stringFromDate:date1];
        return timeStr;
    }
    return @"0";
}

@end
