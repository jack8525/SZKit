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

+ (void)sz_endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:true];
}

- (void)sz_endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:true];
}

+ (void)sz_showLoading
{
    
}
@end
