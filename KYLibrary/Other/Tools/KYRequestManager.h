//
//  KYRequestManager.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
/**
 数据解析器类型
 */
typedef NS_ENUM(NSUInteger, KYResponseSeializerType) {
    /**
     *  默认类型 JSON  如果使用这个响应解析器类型,那么请求返回的数据将会是JSON格式
     */
    KYResponseSeializerTypeDefault,
    /**
     *  JSON类型 如果使用这个响应解析器类型,那么请求返回的数据将会是JSON格式
     */
    KYResponseSeializerTypeJSON,
    /*
     *  XML类型 如果使用这个响应解析器类型,那么请求返回的数据将会是XML格式
     */
    KYResponseSeializerTypeXML,
    /**
     *  Plist类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Plist格式
     */
    KYResponseSeializerTypePlist,
    /*
     *  Compound类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Compound格式
     */
    KYResponseSeializerTypeCompound,
    /**
     *  Image类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Image格式
     */
    KYResponseSeializerTypeImage,
    /**
     *  Data类型 如果使用这个响应解析器类型,那么请求返回的数据将会是二进制格式
     */
    KYResponseSeializerTypeData
};

@interface KYRequestManager : NSObject
/**
 *  GET请求 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param type       数据解析器类型
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString parameters:(id)parameters responseSeializerType:(KYResponseSeializerType)type success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

/**
 *  POST请求 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param type       数据解析器类型
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(KYResponseSeializerType)type success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

/**
 *  POST请求 上传数据 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param type       数据解析器类型
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(KYResponseSeializerType)type constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)cancelAllRequests;

@end
