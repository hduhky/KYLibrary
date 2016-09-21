//
//  KYUtils.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYUtils.h"

@implementation KYUtils

//时间戳转时间
+ (NSString *)datestrFromDate:(NSDate *)date
               withDateFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}

//几天前，几分钟前
+ (NSString *)updateTimeForTimeInterval:(NSInteger)timeInterval {
//获取当前时时间戳 1466386762.345715 十位整数 6位小数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
//创建时间戳(后台返回的时间 一般是13位数字)
    NSTimeInterval createTime = timeInterval;
//时间差
    NSTimeInterval time = currentTime - createTime;
    
//判断
    if (time < 60) {
        return @"刚刚";
    }
//秒转分钟
    NSInteger minutes = time / 60;
    if (minutes < 60) {
        return [NSString stringWithFormat:@"%ld分钟前",minutes];
    }
//秒转小时
    NSInteger hours = time / 3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
//秒转天数
    NSInteger days = time / 3600 / 24;
    if (days < 30) {
        return [NSString stringWithFormat:@"%ld天前",days];
    }
//秒转月
    NSInteger months = time / 3600 / 24 / 30;
    if (months < 12) {
        return [NSString stringWithFormat:@"%ld月前",months];
    }
//秒转年
    NSInteger years = time / 3600 / 24 / 30 / 12;
    return [NSString stringWithFormat:@"%ld年前",years];
}

@end
