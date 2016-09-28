//
//  NSNotification+Addition.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/27.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "NSNotification+Addition.h"

@implementation NSNotification (Addition)

+ (void)postNotification:(NSString *)notiName {
    [[NSNotificationCenter defaultCenter] postNotificationName:notiName object:nil];
}

+ (void)postNotification:(NSString *)notiName object:(id)object {
    if (object == nil) {
        [self postNotification:notiName];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:notiName object:object];
    }
}

+ (void)removeAllObserverForObj:(id)obj {
    [[NSNotificationCenter defaultCenter] removeObserver:obj];
}

+ (void)addObserver:(id)observer action:(SEL)action notiName:(NSString *)notiName {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:action name:notiName object:nil];
}



@end
