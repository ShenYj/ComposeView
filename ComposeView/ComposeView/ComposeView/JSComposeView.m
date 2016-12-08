//
//  JSComposeView.m
//  ComposeView
//
//  Created by ShenYj on 2016/12/8.
//  Copyright © 2016年 ShenYj. All rights reserved.
//

#import "JSComposeView.h"

@interface JSComposeView ()

/** 视觉视效 */
@property (nonatomic) UIVisualEffectView *visualEffectView;
/** slogan */
@property (nonatomic) UIImageView *compose_slogan_IV;
/** 底部View */
@property (nonatomic) UIView *bottom_View;

@end

@implementation JSComposeView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    self.backgroundColor = [UIColor clearColor];
    
    
    [self addSubview:self.visualEffectView];
    self.visualEffectView.frame = self.bounds;
    
    [self addSubview:self.bottom_View];
    
    
    
    [self addSubview:self.compose_slogan_IV];
    self.compose_slogan_IV.frame = CGRectMake(50, 100, 200, 60);
    
    
    
}

// 展示视图
- (void)showComposeView {
    
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:self];
    self.frame = [UIScreen mainScreen].bounds;
    
}


#pragma mark
#pragma mark - lazy

- (UIVisualEffectView *)visualEffectView {
    if (!_visualEffectView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    }
    return _visualEffectView;
}

- (UIImageView *)compose_slogan_IV {
    if (!_compose_slogan_IV) {
        _compose_slogan_IV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"compose_slogan"]];
    }
    return _compose_slogan_IV;
}

- (UIView *)bottom_View {
    if (!_bottom_View) {
        _bottom_View = [[UIView alloc] init];
        _bottom_View.backgroundColor = [UIColor whiteColor];
        UIButton *closeButton = [[UIButton alloc] init];
        [closeButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close@3x"] forState:UIControlStateNormal];
        [_bottom_View addSubview:closeButton];
        closeButton.frame = CGRectInset(closeButton.bounds, 200, 0);
    }
    return _bottom_View;
}


@end
