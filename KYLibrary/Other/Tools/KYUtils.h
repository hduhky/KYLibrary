//
//  KYUtils.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface KYUtils : NSObject
/**
 *  转化时间 时间戳转时间
 */
+ (NSString *)datestrFromDate:(NSDate *)date
               withDateFormat:(NSString *)format;

/**
 *  转化时间
 *  几天前，几分钟前
 */
+ (NSString *)updateTimeForTimeInterval:(NSInteger)timeInterval;

/**
 *  公共富文本
 */
+ (NSAttributedString *)attStringWithString:(NSString *)string keyWord:(NSString *)keyWord;

+ (NSAttributedString *)attStringWithString:(NSString *)string
                                    keyWord:(NSString *)keyWord
                                       font:(UIFont *)font
                           highlightedColor:(UIColor *)highlightedcolor
                                  textColor:(UIColor *)textColor;

+ (NSAttributedString *)attStringWithString:(NSString *)string
                                    keyWord:(NSString *)keyWord
                                       font:(UIFont *)font
                           highlightedColor:(UIColor *)highlightedcolor
                                  textColor:(UIColor *)textColor
                                  lineSpace:(CGFloat)lineSpace;

+ (NSString *)validString:(NSString *)string;

/**
 *  判断字符串是否为空
 */
+ (BOOL)isBlankString:(NSString *)string;

/** 是否是当前用户*/
+ (BOOL)isCurrentUserWithUserId:(NSInteger)userId;

/** color生成image*/
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
