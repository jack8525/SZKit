//
//  UIViewController+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "UIViewController+SZ.h"

@implementation UIViewController (SZ)

- (void)sz_presentNavViewController:(UIViewController *)viewControllerToPresent
{
    [self sz_presentNavViewController:viewControllerToPresent animated:true];
}

- (void)sz_presentNavViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewControllerToPresent];
    [self presentViewController:nav animated:flag completion:nil];
}

- (void)sz_presentAlertView:(NSString *)title completion:(void (^)(NSInteger))completion
{
    [self sz_presentAlertView:title actionTitles:@[@"取消",@"确定"] completion:completion];
}

- (void)sz_presentAlertView:(NSString *)title actionTitles:(nonnull NSArray<NSString *> *)actionTitles completion:(nonnull void (^)(NSInteger))completion
{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (completion) completion(idx);
        }];
        [vc addAction:action];
    }];
    [self presentViewController:vc animated:true completion:nil];
}
@end
