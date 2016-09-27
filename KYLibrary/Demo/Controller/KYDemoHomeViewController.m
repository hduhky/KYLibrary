//
//  KYDemoHomeViewController.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/22.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYDemoHomeViewController.h"
#import "NHCustomPlaceHolderTextView.h"

@interface KYDemoHomeViewController () <NHCustomPlaceHolderTextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *loginStatus;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) NHCustomPlaceHolderTextView *textView;
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
    
    self.textView.placehoder = @"请输入";
}

- (NHCustomPlaceHolderTextView *)textView {
    if (!_textView) {
        NHCustomPlaceHolderTextView *textView = [[NHCustomPlaceHolderTextView   alloc] initWithFrame:CGRectMake(2, kScreenHeight - 200 - 2, kScreenWidth - 4, 200)];
        [self.view addSubview:textView];
        _textView = textView;
        _textView.del = self;
    }
    return _textView;
}

- (void)customPlaceHolderTextViewTextDidChange:(NHCustomPlaceHolderTextView *)textView {
    NSString *text = textView.text;
    
    if (text.length > kMaxInputLimitLength) {
        textView.text = [textView.text substringToIndex:kMaxInputLimitLength];
        textView.count = 0;
    } else {
        textView.count = kMaxInputLimitLength - text.length;
    }

}

//登录操作
- (IBAction)loginAction:(id)sender {
    NSString *deviceToken = [KYFileCacheManager readUserDataForKey:@"DEVICETOKEN"];
    
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
