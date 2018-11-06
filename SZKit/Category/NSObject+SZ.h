//
//  NSObject+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (SZ)

//获取当前控制器
+ (UIViewController *)sz_getCurrentViewController;

- (UIViewController *)sz_getCurrentViewController;

//关闭键盘
+ (void)sz_endEditing;

- (void)sz_endEditing;

//加载指示器
+ (void)sz_showHUDLoading;

+ (void)sz_hideHUD;

+ (void)sz_showHUDHint:(NSString *)hint;

+ (void)sz_showSuccessHUDHint:(NSString *)hint;

+ (void)sz_showErrorHUDHint:(NSString *)hint;

- (void)sz_showHUDLoading;

- (void)sz_hideHUD;

- (void)sz_showHUDHint:(NSString *)hint;

- (void)sz_showSuccessHUDHint:(NSString *)hint;

- (void)sz_showErrorHUDHint:(NSString *)hint;

@end
