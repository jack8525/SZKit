//
//  UIButton+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/20.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "UIButton+SZ.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, copy) void(^actionBlock)(UIButton *);

@end

@implementation UIButton (SZ)

- (void)setAddActionBlock:(void (^)(UIButton *))addActionBlock
{
    [self addActionBlock:addActionBlock];
}

static const char ActionBlockKey = '\0';
- (void)setActionBlock:(void (^)(UIButton *))actionBlock
{
    objc_setAssociatedObject(self, &ActionBlockKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIButton *))actionBlock
{
    return objc_getAssociatedObject(self, &ActionBlockKey);
}

- (void)addActionBlock:(void(^)(UIButton *))actionBlock
{
    if (actionBlock) self.actionBlock = actionBlock;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)button
{
    if (self.actionBlock) self.actionBlock(button);
}

@end
