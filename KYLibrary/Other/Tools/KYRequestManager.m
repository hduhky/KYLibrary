//
//  KYRequestManager.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYRequestManager.h"

@interface AFHTTPSessionManager (Shared)
/**
 设置单例管理

 @return 单例
 */
+ (instancetype)sharedInstance;

@end

@implementation AFHTTPSessionManager (Shared)

+ (instancetype)sharedInstance
{
    static AFHTTPSessionManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AFHTTPSessionManager manager];
        sharedInstance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return sharedInstance;
}

@end

@implementation KYRequestManager
//GET 请求
+ (void)GET:(NSString *)URLString parameters:(id)parameters responseSeializerType:(KYResponseSeializerType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedInstance];
//    请求头
//    manager.requestSerializer setValue:<#(nullable NSString *)#> forHTTPHeaderField:<#(nonnull NSString *)#>
    
//    如果不是JSON 或者 不是 Default 才设置解析器类型
    if (type != KYResponseSeializerTypeJSON && type != KYResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    // https证书设置
    /*
     AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
     policy.allowInvalidCertificates = YES;
     manager.securityPolicy  = policy;
     */
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败
        if (failure) {
            failure(error);
        }
    }];
}

//POST 请求
+ (void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(KYResponseSeializerType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedInstance];
    // 请求头
//    [manager.requestSerializer setValue:[self cookie] forHTTPHeaderField:@"Authorization"];
    
    // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != KYResponseSeializerTypeJSON && type != KYResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    //  https证书设置
    
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    policy.allowInvalidCertificates = YES;
    manager.securityPolicy  = policy;
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败
        if (failure) {
            failure(error);
        }
    }];
}

//POST 上传
+ (void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(KYResponseSeializerType)type constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedInstance];
    
    // 请求头
    //    NSString *value = [NSString stringWithFormat:@"Bearer %@",[ CommonTool validStringWithObj:kUserInfo[@"token"]]];
    //    if (value) {
    //        [manager.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
    //    }
    // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != KYResponseSeializerTypeJSON && type != KYResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    // https证书设置
    /*
     AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
     policy.allowInvalidCertificates = YES;
     manager.securityPolicy  = policy;
     */

    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (block) {
            block(formData);
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


/**
 *  设置数据解析器类型
 *  @param serilizerType 数据解析器类型
 */
+ (AFHTTPResponseSerializer *)responseSearalizerWithSerilizerType:(KYResponseSeializerType)serilizerType {
    
    switch (serilizerType) {
            
        case KYResponseSeializerTypeDefault: // default is JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case KYResponseSeializerTypeJSON: // JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case KYResponseSeializerTypeXML: // XML
            return [AFXMLParserResponseSerializer serializer];
            break;
            
        case KYResponseSeializerTypePlist: // Plist
            return [AFPropertyListResponseSerializer serializer];
            break;
            
        case KYResponseSeializerTypeCompound: // Compound
            return [AFCompoundResponseSerializer serializer];
            break;
            
        case KYResponseSeializerTypeImage: // Image
            return [AFImageResponseSerializer serializer];
            break;
            
        case KYResponseSeializerTypeData: // Data
            return [AFHTTPResponseSerializer serializer];
            break;
            
        default:  // 默认解析器为 JSON解析
            return [AFJSONResponseSerializer serializer];
            break;
    }
}

+ (void)cancelAllRequests {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedInstance];
    [manager.operationQueue cancelAllOperations];
}

@end
