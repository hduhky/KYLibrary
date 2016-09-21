//
//  KYUserInfoManager.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYUserInfoManager : NSObject
/**
 单例
 */
+ (instancetype)sharedInstance;

/**
 *  登录成功
 */
- (void)didLoginInWithUserInfo:(id)userInfo;

/**
 *  退出
 */
- (void)didLoginOut;

/**
 *  获取用户信息
 */
//- (NHNeiHanUserInfoModel *)currentUserInfo;

/**
 *  更新缓存中的用户信息
 */
//- (void)resetUserInfoWithUserInfo:(NHNeiHanUserInfoModel *)userInfo;

/**
 *  用来记录是否是登陆状态
 */
@property (nonatomic, assign) BOOL isLogin;

@end
