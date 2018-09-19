//
//  UIViewController+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "UIViewController+SZ.h"

@implementation UIViewController (SZ)

- (void)presentNavViewController:(UIViewController *)viewControllerToPresent
{
    [self presentNavViewController:viewControllerToPresent animated:true];
}

- (void)presentNavViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewControllerToPresent];
    [self presentViewController:nav animated:flag completion:nil];
}

@end
