//
//  UILabel+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SZ)

/**
 计算内容高度

 @param maxWidth 最大宽度
 @return 高度
 */
- (CGFloat)sz_textHeightWithMaxWidth:(CGFloat)maxWidth;

@end
