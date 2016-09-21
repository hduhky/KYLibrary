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
 *  字典数组转模型数组
 */
+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response {
    
}

/**
 *  字典转模型
 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    
}

/**
 *  模型包含模型数组
 */
+ (void)setUpModelClassInArrayWithContainDict:(NSDictionary *)dict {
    
}

/**
 *  字典数组转模型数组
 *  @param dict     模型包含模型数组 格式为 key-字段名字 value-[被包含的类名]
 */
+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response containDict:(NSDictionary *)dict {
    
}

@end
