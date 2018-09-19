//
//  NSDate+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateFormatter+SZ.h"

@interface NSDate (SZ)

/**
 将当前时间转换成字符串

 @param format 时间格式
 @return 时间字符串
 */
- (NSString *)stringWithFormat:(NSString *)format;

@end
