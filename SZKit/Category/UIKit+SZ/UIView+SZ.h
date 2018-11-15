//
//  UIView+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/20.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SZ)

- (UIViewController *)superViewController;

@property (nonatomic, assign) CGFloat fontSize;

- (void)startActivity;

- (void)stopActivity;

- (BOOL)isActiviting;

@end
