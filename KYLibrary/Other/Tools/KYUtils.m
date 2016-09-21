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

//富文本

+ (NSAttributedString *)attStringWithString:(NSString *)string
                                    keyWord:(NSString *)keyWord {
    return [self attStringWithString:string keyWord:keyWord font:kFont(16) highlightedColor:kRedColor textColor:kBlackColor];
}

+(NSAttributedString *)attStringWithString:(NSString *)string
                                   keyWord:(NSString *)keyWord
                                      font:(UIFont *)font
                          highlightedColor:(UIColor *)highlightedcolor textColor:(UIColor *)textColor {
    return [self attStringWithString:string keyWord:keyWord font:font highlightedColor:highlightedcolor textColor:textColor lineSpace:2.0];
}

+ (NSAttributedString *)attStringWithString:(NSString *)string
                                    keyWord:(NSString *)keyWord
                                       font:(UIFont *)font
                           highlightedColor:(UIColor *)highlightedcolor
                                  textColor:(UIColor *)textColor
                                  lineSpace:(CGFloat)lineSpace {
    
//判断string是否存在
    if (string.length) {
//创建公共富文本
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
        NSRange allRange = NSMakeRange(0, string.length);
        [attStr addAttribute:NSFontAttributeName value:font range:allRange];
        [attStr addAttribute:NSForegroundColorAttributeName value:textColor range:allRange];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = lineSpace;
        [attStr addAttribute:NSParagraphStyleAttributeName value:style range:allRange];
//判断关键字key是否存在
//不存在 返回默认富文本
        if (!keyWord || keyWord.length == 0) {
            return attStr;
        }
//确定关键字key的range
        NSRange range = [string rangeOfString:keyWord options:NSCaseInsensitiveSearch];
//定位到关键字
        if (range.location != NSNotFound) {
            [attStr addAttribute:NSForegroundColorAttributeName value:highlightedcolor range:range];
            return attStr;
        } else {
//没有定位到关键字
            return attStr;
        }
    }
    return [[NSAttributedString alloc] init];
}

/**
 字符串返回非空
 */
+ (NSString *)validString:(NSString *)string {
    if ([self isBlankString:string]) {
        return kEmptyStr;
    } else {
        return string;
    }
}

/**
 *判断字符串是否为空
 */
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] == NO) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    if ([string isEqualToString:kEmptyStr]) {
        return YES;
    }
    return NO;
}


/**
 *用色彩创建图像
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
