//
//  KYUserInfoManager.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYUserInfoManager.h"

@implementation KYUserInfoManager
//单例
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//登录成功保存用户信息
- (void)didLoginInWithUserInfo:(id)userInfo {
    
}

@end
