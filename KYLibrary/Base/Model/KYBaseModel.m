//
//  KYBaseModel.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYBaseModel.h"

@implementation KYBaseModel
/**
 *  归档 - 存入模型
 */
- (void)archive {
    [KYFileCacheManager saveObject:self byFileName:[self.class description]];
}

/**
 *  解档 - 取出模型
 */
- (id)unarchiver {
    id obj = [KYFileCacheManager getObjectByFileName:[self.class description]];
    return obj;
}

/**
 *  移除缓存中的模型
 */
- (void)remove {
    [KYFileCacheManager removeObjectByFileName:[self.class description]];
}

/**
 *  字典转模型
 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        id obj = [[self alloc] init];
        [obj yy_modelSetWithDictionary:dictionary];
        return obj;
    }
    return [[self alloc] init];
}
@end
