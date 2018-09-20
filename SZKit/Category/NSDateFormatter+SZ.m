//
//  NSDateFormatter+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "NSDateFormatter+SZ.h"

@implementation NSDateFormatter (SZ)

+ (instancetype)sz_dateFormatterWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = format;
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    return dateFormatter;
}

@end
