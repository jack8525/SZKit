//
//  NSDateFormatter+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const DateFormtyMdHms = @"yyyy-MM-dd HH:mm:ss";
static NSString * const DateFormtyMdHm = @"yyyy-MM-dd HH:mm";
static NSString * const DateFormtyMd = @"yyyy-MM-dd";
static NSString * const DateFormtyM = @"yyyy-MM";
static NSString * const DateFormtHm = @"HH:mm";

@interface NSDateFormatter (SZ)

/**
 初始化时间格式器

 @param format 时间格式
 @return NSDateFormatter
 */
+ (instancetype)dateFormatterWithFormat:(NSString *)format;

@end
