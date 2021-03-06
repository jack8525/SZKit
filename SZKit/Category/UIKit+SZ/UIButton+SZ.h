//
//  UIButton+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/20.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SZ)

@property (nonatomic, copy) void(^addActionBlock)(UIButton *button);

- (void)addActionBlock:(void(^)(UIButton *button))actionBlock;

@end
