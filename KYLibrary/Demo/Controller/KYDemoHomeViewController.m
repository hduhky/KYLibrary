//
//  KYDemoHomeViewController.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/22.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYDemoHomeViewController.h"

@interface KYDemoHomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *loginStatus;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation KYDemoHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[KYUserInfoManager sharedInstance] isLogin]) {
        self.loginStatus.text = @"已登录";
        [self.loginButton setTitle:@"登出" forState:UIControlStateNormal];
    } else {
        self.loginStatus.text = @"未登录";
        [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    }
}

//登录操作
- (IBAction)loginAction:(id)sender {
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"DEVICETOKEN"];
    
    NSDictionary *dict = @{
                           @"mobile":@"15958143182",
                           @"smsCode":@"123123",
                           @"deviceToken":deviceToken ? deviceToken:@""
                           };
    
    [KYRequestManager GET:@"http://114.55.143.170:8080/userInfo/login" parameters:dict responseSeializerType:KYResponseSeializerTypeDefault success:^(id responseObject) {
        [[KYUserInfoManager sharedInstance] didLoginInWithUserInfo:[responseObject objectForKey:@"resultData"]];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end