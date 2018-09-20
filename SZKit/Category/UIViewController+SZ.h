//
//  UIViewController+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SZ)

/**
 推出含有导航栏的控制器,默认有动画

 @param viewControllerToPresent 要推出的控制器
 */
- (void)presentNavViewController:(UIViewController *)viewControllerToPresent;

/**
 推出含有导航栏的控制器

 @param viewControllerToPresent 要推出的控制器
 @param flag 是否有动画
 */
- (void)presentNavViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag;

- (void)mas;
@end
