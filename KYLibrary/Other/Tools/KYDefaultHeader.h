//
//  KYDefaultHeader.h
//  KYLibrary
//
//  Created by 黄珂耀 on 2016/9/21.
//  Copyright © 2016年 黄珂耀. All rights reserved.
//

#ifndef KYDefaultHeader_h
#define KYDefaultHeader_h
/**
 弱指针
*/
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#pragma mark - 颜色
#define kWhiteColor [UIColor whiteColor]
#define kBlackColor [UIColor blackColor]
#define kDarkGrayColor [UIColor darkGrayColor]
#define kLightGrayColor [UIColor lightGrayColor]
#define kGrayColor [UIColor grayColor]
#define kRedColor [UIColor redColor]
#define kGreenColor [UIColor greenColor]
#define kBlueColor [UIColor blueColor]
#define kCyanColor [UIColor cyanColor]
#define kYellowColor [UIColor yellowColor]
#define kMagentaColor [UIColor magentaColor]
#define kOrangeColor [UIColor orangeColor]
#define kPurpleColor [UIColor purpleColor]
#define kBrownColor [UIColor brownColor]
#define kClearColor [UIColor clearColor]

#pragma mark - 系统UI
#define kNavigationBarHeight 44
#define kStatusBarHeight 20
#define kTopBarHeight 64
#define kToolBarHeight 44
#define kTabBarHeight 49
#define kiPhone4_W 320
#define kiPhone4_H 480
#define kiPhone5_W 320
#define kiPhone5_H 568
#define kiPhone6_W 375
#define kiPhone6_H 667
#define kiPhone6P_W 414
#define kiPhone6P_H 736

/***  当前屏幕宽度 */
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
/***  当前屏幕高度 */
#define kScreenHeight  [[UIScreen mainScreen] bounds].size.height
/***  普通字体 */
#define kFont(size) [UIFont systemFontOfSize:size]
/***  粗体 */
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]

#pragma mark - 字符串转化
#define kEmptyStr @""
#define kIntToStr(i) [NSString stringWithFormat: @"%d", i]
#define kIntegerToStr(i) [NSString stringWithFormat: @"%ld", i]

#endif /* KYDefaultHeader_h */
