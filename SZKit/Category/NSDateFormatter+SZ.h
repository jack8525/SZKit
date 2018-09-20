//
//  NSDateFormatter+SZ.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const SZDateFormtyMdHms = @"yyyy-MM-dd HH:mm:ss";
static NSString * const SZDateFormtyMdHm = @"yyyy-MM-dd HH:mm";
static NSString * const SZDateFormtyMd = @"yyyy-MM-dd";
static NSString * const SZDateFormtyM = @"yyyy-MM";
static NSString * const SZDateFormtHm = @"HH:mm";

@interface NSDateFormatter (SZ)

/**
 初始化时间格式器

 @param format 时间格式
 @return NSDateFormatter
 */
+ (instancetype)sz_dateFormatterWithFormat:(NSString *)format;

@end
