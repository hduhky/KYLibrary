//
//  KYBaseTableViewController.m
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/20.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#import "KYBaseTableViewController.h"

@interface KYBaseTableViewController ()

@end

@implementation KYBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)ky_setUpNavRightItemTitle:(NSString *)itemTitle handle:(void (^)(NSString *))handle {
    
}

- (void)ky_setUpNavLeftItemTitle:(NSString *)itemTitle handle:(void(^)(NSString *rightItemTitle))handle {
    
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
