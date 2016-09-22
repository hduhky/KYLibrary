//
//  KYUserInfoManager.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYUserInfoManager.h"
#import "KYUserInfoModel.h"

@implementation KYUserInfoManager
/** 是否登陆*/
NSString *const kHasLoginFlag = @"kHasLoginFlag";

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

- (KYUserInfoModel *)currentUserInfo {
    id obj = [KYFileCacheManager getObjectByFileName:NSStringFromClass([KYUserInfoModel class])];
    if (obj != nil) {
        return obj;
    }
    return obj;
}

- (void)resetUserInfoWithUserInfo:(KYUserInfoModel *)userInfo {
    [userInfo archive];
}

//登录成功保存用户信息
- (void)didLoginInWithUserInfo:(id)userInfo {
    KYUserInfoModel *info = [KYUserInfoModel modelWithDictionary:userInfo];
    [info archive];
    [KYFileCacheManager saveUserData:@YES forKey:kHasLoginFlag];
}

//退出登录移除用户信息
- (void)didLoginOut {
    [KYFileCacheManager removeObjectByFileName:NSStringFromClass([KYUserInfoModel class])];
    [KYFileCacheManager saveUserData:@NO forKey:kHasLoginFlag];
    
}

- (BOOL)isLogin {
    return [KYFileCacheManager readUserDataForKey:kHasLoginFlag];
}


@end
