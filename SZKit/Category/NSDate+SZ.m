//
//  NSDate+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "NSDate+SZ.h"

@implementation NSDate (SZ)

- (NSString *)sz_stringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [NSDateFormatter sz_dateFormatterWithFormat:format];
    return [dateFormatter stringFromDate:self];
}

@end
