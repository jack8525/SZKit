//
//  GlobalDefine.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/20.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SZ_SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SZ_SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

// 十六位颜色 转 UIColor
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]
//RGB 转 UIColor
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface SZGlobalDefine : NSObject

@end
