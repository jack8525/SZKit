//
//  SZTextField.m
//  SZKit
//
//  Created by 张杰华 on 2018/11/6.
//  Copyright © 2018 张杰华. All rights reserved.
//

#import "SZTextField.h"

@implementation SZTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    UIMenuController *menu = [UIMenuController sharedMenuController];
    if (menu) {
        [UIMenuController sharedMenuController].menuVisible = false;
    }
    return false;
}

@end
