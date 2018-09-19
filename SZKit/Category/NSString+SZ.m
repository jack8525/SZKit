//
//  NSString+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/18.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "NSString+SZ.h"

@implementation NSString (SZ)

- (CGFloat)heightWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font
{
    UIFont *defaultFont = font;
    if (!defaultFont) defaultFont = [[UILabel alloc]init].font;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    //NSStringDrawingOptions
    //NSStringDrawingUsesLineFragmentOrigin:
    //  整个文本将以每行组成的矩形为单位计算整个文本的尺寸
    //NSStringDrawingUsesFontLeading:
    //  以字体间的行距（leading，行距：从一行文字的底部到另一行文字底部的间距。）来计算.同时使用这个,计算更准确
    //NSStringDrawingTruncatesLastVisibleLine:
    //  文本不能适合的放进指定的边界之内，则自动在最后一行添加省略符号。如果NSStringDrawingUsesLineFragmentOrigin没有设置，则该选项不生效
    //NSStringDrawingUsesDeviceMetric:
    //  将文字以图像符号计算文本占用范围，而不是以字符计算。也即是以每一个字体所占用的空间来计算文本范围.
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:defaultFont, NSParagraphStyleAttributeName:paragraphStyle.copy} context:nil].size;
    
    return size.height;
}

- (NSString *)appendHTMLString
{
    NSMutableString *newHtml = [NSMutableString stringWithString:self];
    NSString *regex = @"(width)=[\"]+[0-9]+[\"]";
    NSRange r;
    BOOL flag = false;
    NSUInteger lastLocation = 0;
    while (flag == false) {
        r = [newHtml rangeOfString:regex options:NSRegularExpressionSearch];
        if (r.location != NSNotFound && r.location > lastLocation) {
            [newHtml replaceCharactersInRange:r withString:@"width:\"100%\""];
            lastLocation = r.location;
        } else {
            flag = true;
        }
    };
    
    regex = @"(height)=[\"]+[0-9]+[\"]";
    flag = false;
    lastLocation = 0;
    while (flag == false) {
        r = [newHtml rangeOfString:regex options:NSRegularExpressionSearch];
        if (r.location != NSNotFound && r.location > lastLocation) {
            [newHtml replaceCharactersInRange:r withString:@"height:\"100%\""];
            lastLocation = r.location;
        } else {
            flag = true;
        }
    };
    
    NSMutableString *webConStr = [[NSMutableString alloc] initWithCapacity:0];
    [webConStr appendString:@"<html>"];
    [webConStr appendString:@"<head>"];
    [webConStr appendString:@"<style type=\"text/css\">"];
    [webConStr appendString:@"img {width:500px;margin:0 auto;}"];
    [webConStr appendString:@".content{position:relative;margin:0px;padding-left:0px;padding-right:0px;}"];
    [webConStr appendString:@"</style>"];
    [webConStr appendString:@"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"];
    [webConStr appendString:@"<meta name=\"viewport\" content=\"width=device-width, user-scalable=yes\">"];
    [webConStr appendString:@"</head>"];
    [webConStr appendString:@"<body>"];
    [webConStr appendString:@"<div class=\"content\">"];
    [webConStr appendFormat:@"<font color='#595959' size='5'>%@</font>", newHtml];
    [webConStr appendString:@"</div>"];
    [webConStr appendString:@"</body>"];
    [webConStr appendString:@"</html>"];
    return webConStr;
}

- (BOOL)validateIDCardNumber
{
    NSString *value = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger length =0;
    
    if (!value) {
        return NO;
    }else {
        length = value.length;
        //不满足15位和18位，即身份证错误
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    
    // 省份代码
    NSArray *areasArray = @[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    // 检测省份身份行政区代码
    NSString *valueStart2 = [value substringToIndex:2];
    
    BOOL areaFlag =NO; //标识省份代码是否正确
    
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    if (!areaFlag) {
        return NO;
    }
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    int year =0;
    //分为15位、18位身份证进行校验
    switch (length) {
        case 15:
            //获取年份对应的数字
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                //创建正则表达式 NSRegularExpressionCaseInsensitive：不区分字母大小写的模式
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }else{
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            //使用正则表达式匹配字符串 NSMatchingReportProgress:找到最长的匹配字符串后调用block回调
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            if(numberofMatch >0) {
                //1：校验码的计算方法 身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7－9－10－5－8－4－2－1－6－3－7－9－10－5－8－4－2。将这17位数字和系数相乘的结果相加。
                int S = [value substringWithRange:NSMakeRange(0,1)].intValue*7 + [value substringWithRange:NSMakeRange(10,1)].intValue *7 + [value substringWithRange:NSMakeRange(1,1)].intValue*9 + [value substringWithRange:NSMakeRange(11,1)].intValue *9 + [value substringWithRange:NSMakeRange(2,1)].intValue*10 + [value substringWithRange:NSMakeRange(12,1)].intValue *10 + [value substringWithRange:NSMakeRange(3,1)].intValue*5 + [value substringWithRange:NSMakeRange(13,1)].intValue *5 + [value substringWithRange:NSMakeRange(4,1)].intValue*8 + [value substringWithRange:NSMakeRange(14,1)].intValue *8 + [value substringWithRange:NSMakeRange(5,1)].intValue*4 + [value substringWithRange:NSMakeRange(15,1)].intValue *4 + [value substringWithRange:NSMakeRange(6,1)].intValue*2 + [value substringWithRange:NSMakeRange(16,1)].intValue *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                
                //2：用加出来和除以11，看余数是多少？余数只可能有0－1－2－3－4－5－6－7－8－9－10这11个数字
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 3：获取校验位
                NSString *lastStr = [value substringWithRange:NSMakeRange(17,1)];
                //4：检测ID的校验位
                if ([lastStr isEqualToString:@"x"]) {
                    if ([M isEqualToString:@"X"]) {
                        return YES;
                    }else{
                        return NO;
                    }
                }else{
                    if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                        return YES;
                    }else {
                        return NO;
                    }
                }
            }else {
                return NO;
            }
        default:
            return NO;
    }
}
@end
