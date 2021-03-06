//
//  UILabel+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "UILabel+SZ.h"
#import "NSString+SZ.h"

@implementation UILabel (SZ)

- (CGFloat)sz_textHeightWithMaxWidth:(CGFloat)maxWidth
{
    return [self.text sz_heightWithMaxWidth:maxWidth font:self.font];
}

@end
