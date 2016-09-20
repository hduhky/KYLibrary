//
//  KYBaseViewController.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/20.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYBaseViewController : UIViewController

- (void)pop;

- (void)popToRootVc;

- (void)popToVc:(UIViewController *)vc;

- (void)dismiss;

- (void)dismissWithCompletion:(void(^)())completion;

- (void)presentVc:(UIViewController *)vc;

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion;

- (void)pushVc:(UIViewController *)vc;

- (void)removeChildVc:(UIViewController *)childVc;

- (void)addChildVc:(UIViewController *)childVc;

@end
