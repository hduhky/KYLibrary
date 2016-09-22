//
//  KYUserInfoManager.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KYUserInfoModel;

@interface KYUserInfoManager : NSObject

@property (nonatomic, assign) BOOL isLogin;

/** 是否登陆*/
UIKIT_EXTERN NSString *const kHasLoginFlag;
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
- (KYUserInfoModel *)currentUserInfo;

/**
 *  更新缓存中的用户信息
 */
- (void)resetUserInfoWithUserInfo:(KYUserInfoModel *)userInfo;

/**
 *  用来记录是否是登陆状态
 */

@end
