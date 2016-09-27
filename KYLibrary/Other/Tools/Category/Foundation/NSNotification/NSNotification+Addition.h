//
//  NSNotification+Addition.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/27.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotification (Addition)
/**
 发送一个通知
 */
+ (void)postNotification:(NSString *)notiName;

/**
 发送一个通知

 @param notiName 通知名
 @param object   通知内容
 */
+ (void)postNotification:(NSString *)notiName object:(id)object;

/**
 移除所有通知的注册者
 */
+ (void)removeAllObserverForObj:(id)obj;

/**
 *  注册一个通知
 */
+ (void)addObserver:(id)observer action:(SEL)action notiName:(NSString *)notiName;

@end
