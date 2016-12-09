//
//  JSComposeView.m
//  ComposeView
//
//  Created by ShenYj on 2016/12/8.
//  Copyright © 2016年 ShenYj. All rights reserved.
//

#import "JSComposeView.h"
#import "JSComposeButton.h"
#import "Masonry.h"

@interface JSComposeView ()

/** 视觉视效 */
@property (nonatomic) UIVisualEffectView *visualEffectView;
/** slogan */
@property (nonatomic) UIImageView *compose_slogan_IV;
/** 中间的按钮区ScrollView */
@property (nonatomic) UIScrollView *centerArea_ScrollView;
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
    [self addSubview:self.centerArea_ScrollView];
    
    [self.bottom_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(44);
    }];
    
    [self.centerArea_ScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.bottom_View.mas_top).mas_offset(42);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(224);
    }];
    
    [self.compose_slogan_IV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).mas_offset(100);
    }];
    
    JSComposeButton *composeButton = [[JSComposeButton alloc] initWithTitle:@"demo" imageName:@"tabbar_compose_more"];
    
    [self addSubview:composeButton];
    [composeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
    }];
    
    
}


// 展示视图
- (void)showComposeView {
    
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:self];
    self.frame = [UIScreen mainScreen].bounds;
    
}

#pragma mark
#pragma mark 
- (void)clickCloseButton:(UIButton *)sender {
    [self removeFromSuperview];
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

- (UIScrollView *)centerArea_ScrollView {
    if (!_centerArea_ScrollView) {
        _centerArea_ScrollView = [[UIScrollView alloc] init];
    }
    return _centerArea_ScrollView;
}

- (UIView *)bottom_View {
    if (!_bottom_View) {
        _bottom_View = [[UIView alloc] init];
        _bottom_View.backgroundColor = [UIColor whiteColor];
        UIButton *closeButton = [[UIButton alloc] init];
        [closeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateNormal];
        [_bottom_View addSubview:closeButton];
        [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_bottom_View);
            make.centerX.mas_equalTo(_bottom_View);
            make.height.mas_equalTo(_bottom_View);
            make.width.mas_equalTo(_bottom_View.mas_height);
        }];
        [closeButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottom_View;
}


@end
