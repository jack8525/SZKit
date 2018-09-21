//
//  NSObject+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "NSObject+SZ.h"

#import <SVProgressHUD/SVProgressHUD.h>

@implementation NSObject (SZ)

- (UIViewController *)getCurrentViewController
{
    return [NSObject getCurrentViewController];
}

+ (UIViewController *)getCurrentViewController {
    
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    if (!window) {
        return nil;
    }
    UIView *tempView;
    for (UIView *subview in window.subviews) {
        if ([[subview.classForCoder description] isEqualToString:@"UILayoutContainerView"]) {
            tempView = subview;
            break;
        }
    }
    if (!tempView) {
        tempView = [window.subviews lastObject];
    }
    
    id nextResponder = [tempView nextResponder];
    while (![nextResponder isKindOfClass:[UIViewController class]] || [nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UITabBarController class]]) {
        tempView =  [tempView.subviews firstObject];
        
        if (!tempView) {
            return nil;
        }
        nextResponder = [tempView nextResponder];
    }
    return  (UIViewController *)nextResponder;
}

+ (void)sz_endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:true];
}

- (void)sz_endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:true];
}

+ (void)sz_showHUDLoading
{
    [SVProgressHUD showWithStatus:@"加载中..."];
}

+ (void)sz_hideHUD
{
    [SVProgressHUD dismiss];
}

+ (void)sz_showHUDHint:(NSString *)hint
{
    [SVProgressHUD showInfoWithStatus:hint];
}

- (void)sz_showHUDLoading
{
    [NSObject sz_showHUDLoading];
}

- (void)sz_hideHUD
{
    [NSObject sz_hideHUD];
}

- (void)sz_showHUDHint:(NSString *)hint
{
    [NSObject sz_showHUDHint:hint];
}
@end
