//
//  KYBaseTableViewController.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/20.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYBaseViewController.h"

@interface KYBaseTableViewController : KYBaseViewController <UITableViewDelegate,UITableViewDataSource>

/** 设置导航栏右边的item*/
- (void)ky_setUpNavRightItemTitle:(NSString *)itemTitle handle:(void(^)(NSString *rightItemTitle))handle;

/** 设置导航栏左边的item*/
- (void)ky_setUpNavLeftItemTitle:(NSString *)itemTitle handle:(void(^)(NSString *rightItemTitle))handle;

@end
