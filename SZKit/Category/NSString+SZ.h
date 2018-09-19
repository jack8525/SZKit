//
//  NSString+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/18.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SZ)

/**
 计算文字大小

 @param maxWidth 最大宽度
 @param font 字体
 @return 高度
 */
- (CGFloat)heightWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font;

/**
 给内容添加html格式

 @return html格式的内容
 */
- (NSString *)appendHTMLString;

/**
 验证身份证格式

 @return 布尔值
 */
- (BOOL)validateIDCardNumber;
@end
