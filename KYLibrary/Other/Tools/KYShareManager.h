//
//  KYShareManager.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYShareManager : NSObject

/**
 *单例
 */
+ (instancetype)sharedInstance;

/**
 *注册
 */
- (void)registAllPlatforms;

@end
