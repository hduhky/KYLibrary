//
//  KYFileCacheManager.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/20.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYFileCacheManager.h"
#import "NSFileManager+Paths.h"

@implementation KYFileCacheManager

#pragma mark - CacheManager
// 把对象归档存到沙盒里
+ (BOOL)saveObject:(id)object byFileName:(NSString*)fileName {
    NSString *path = [self getFilePathWithFileName:fileName];
    BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:path];
    return success;
}

//通过文件名从沙盒中找到归档的对象
+ (id)getObjectByFileName:(NSString*)fileName {
    NSString *path = [self getFilePathWithFileName:fileName];
    id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return obj;
}

//根据文件名删除沙盒中的归档对象
+ (void)removeObjectByFileName:(NSString*)fileName {
    NSString *path = [self getFilePathWithFileName:fileName];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

+ (NSString *)appendFilename:(NSString *)fileName {
    
    // 1. 沙盒缓存路径
    NSString *cachesPath = [NSFileManager cachesPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachesPath isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cachesPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    return cachesPath;
}

+ (NSString *)getFilePathWithFileName:(NSString *)fileName {
    // 1. 沙盒缓存路径
    NSString *cachesPath = [NSFileManager cachesPath];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",cachesPath,fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    filePath = [filePath stringByAppendingString:@".archive"];
    
    return filePath;
}


#pragma mark - UserDefaults
//存储用户偏好设置 到 NSUserDefults
+ (void)saveUserData:(id)data forKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//读取用户偏好设置
+(id)readUserDataForKey:(NSString*)key {
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return obj;
}

//删除用户偏好设置
+(void)removeUserDataForkey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
