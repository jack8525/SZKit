//
//  NSObject+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "NSObject+SZ.h"
#import <UIKit/UIKit.h>

@implementation NSObject (SZ)

+ (void)endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:true];
}

- (void)endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:true];
}
@end
