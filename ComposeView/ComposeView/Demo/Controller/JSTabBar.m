//
//  JSTabBar.m
//  ComposeView
//
//  Created by ShenYj on 2016/12/8.
//  Copyright © 2016年 ShenYj. All rights reserved.
//

#import "JSTabBar.h"

@interface JSTabBar ()

@property (nonatomic,strong) UIButton *composeButton;

@end

@implementation JSTabBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    
    [self addSubview:self.composeButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat buttonWidth = [UIScreen mainScreen].bounds.size.width / 5;
    int index = 0;
    for (UIView *view in self.subviews) {
        
        if ( [view isKindOfClass:NSClassFromString(@"UITabBarButton")] ) {
            if (index == 2) {
                index++;
            }
            view.frame = CGRectMake(index * buttonWidth, 0, buttonWidth, 49);
            index++;
        }
    }
    //self.composeButton.frame = CGRectMake(buttonWidth*2, 0, buttonWidth, 49);
    self.composeButton.frame = CGRectInset(self.bounds, buttonWidth*2, 0);
}

#pragma mark
#pragma mark - target

- (void)clickComposeButton:(UIButton *)composeButton {
    if ([self.composeDelegate respondsToSelector:@selector(tabBar:withComposeButtonClick:)]) {
        [self.composeDelegate tabBar:self withComposeButtonClick:composeButton];
    }
}

#pragma mark
#pragma mark - lazy

- (UIButton *)composeButton {
    if (!_composeButton) {
        _composeButton = [[UIButton alloc] init];
        [_composeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_composeButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [_composeButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_composeButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [_composeButton addTarget:self action:@selector(clickComposeButton:) forControlEvents:UIControlEventTouchUpInside];
        [_composeButton sizeToFit];
    }
    return _composeButton;
}

@end
