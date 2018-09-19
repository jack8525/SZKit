//
//  NSDate+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/19.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "NSDate+SZ.h"

@implementation NSDate (SZ)

- (NSString *)stringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormat:format];
    return [dateFormatter stringFromDate:self];
}

@end
