//
//  KYUserInfoModel.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYBaseModel.h"

@interface KYUserInfoModel : KYBaseModel

/**
 *  手机号
 */
@property (nonatomic, copy) NSString *mobile;
/**
 *  用户id
 */
@property (nonatomic, assign) NSInteger userId;
/**
 *  用户头像
 */
@property (nonatomic, copy) NSString *userImage;
/**
 *  用户昵称
 */
@property (nonatomic, copy) NSString *userName;
/**
 *  refreshToken
 */
@property (nonatomic, copy) NSString *refreshToken;
/**
 *  Toke信息
 */
@property (nonatomic, copy) NSString *token;
/**
 *  Token时效
 */
@property (nonatomic, assign) NSTimeInterval expiresIn;
/**
 *  性别
 */
@property (nonatomic, copy) NSString *sex;
/**
 *  access token 的过期日期，由设置 expires_in 时设置
 */
@property (nonatomic, strong) NSDate *expiresDate;
/**
 *  升级token的时间
 */
@property (nonatomic,strong) NSDate *updateTokenDate;
/**
 *  是否自动开锁 1 是 0 否
 */
@property (nonatomic,assign) BOOL isAutomaticLock;
/**
 *  是否开启手势密码 0 否 1 开启
 */
@property (nonatomic,assign) BOOL isOpenGesturePassword;
/**
 *  手势密码
 */
@property (nonatomic,copy) NSString *gesturePassword;
/**
 *  是否开启touch id
 */
@property (nonatomic,assign) NSInteger isOpenTouchId;


@end
