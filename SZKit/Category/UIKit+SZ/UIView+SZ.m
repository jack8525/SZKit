//
//  UIView+SZ.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/20.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "UIView+SZ.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>

@implementation UIView (SZ)

static const char FontSizeKey = '\0';
- (void)setFontSize:(CGFloat)fontSize
{
    objc_setAssociatedObject(self, &FontSizeKey, @(fontSize), OBJC_ASSOCIATION_ASSIGN);
    
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)self;
        label.font = [UIFont systemFontOfSize:fontSize];
    }else if ([self isKindOfClass:[UITextField class]]) {
        UITextField *label = (UITextField *)self;
        label.font = [UIFont systemFontOfSize:fontSize];
    }else if ([self isKindOfClass:[UITextView class]]) {
        UITextView *label = (UITextView *)self;
        label.font = [UIFont systemFontOfSize:fontSize];
    }else if ([self isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)self;
        button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
        
}

- (CGFloat)fontSize
{
    return [objc_getAssociatedObject(self, &FontSizeKey) floatValue];
}

#define UIActivityIndicatorView_Tag 19237434325
- (void)startActivity
{
    UIActivityIndicatorView *view = [self viewWithTag:UIActivityIndicatorView_Tag];
    if (!view) {
        view = [[UIActivityIndicatorView alloc]init];
        view.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        view.tag = UIActivityIndicatorView_Tag;
        view.hidesWhenStopped = true;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@30);
            make.center.equalTo(self);
        }];
    }
    [self bringSubviewToFront:view];
    [view startAnimating];
}

- (void)stopActivity
{
    UIActivityIndicatorView *view = [self viewWithTag:UIActivityIndicatorView_Tag];
    [view stopAnimating];
}

- (BOOL)isActiviting
{
    UIActivityIndicatorView *view = [self viewWithTag:UIActivityIndicatorView_Tag];
    return [view isAnimating];
}

@end
