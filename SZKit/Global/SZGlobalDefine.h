//
//  GlobalDefine.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/20.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SZ_SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SZ_SCREEH_HEIGHT    [UIScreen mainScreen].bounds.size.height

// 将用int表示的颜色(rgba)转换为UIColor
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]

@interface SZGlobalDefine : NSObject

@end
