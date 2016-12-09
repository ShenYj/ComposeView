//
//  JSComposeButton.m
//  ComposeView
//
//  Created by ShenYj on 2016/12/9.
//  Copyright © 2016年 ShenYj. All rights reserved.
//

#import "JSComposeButton.h"
#import "Masonry.h"

@interface JSComposeButton ()

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *label;
@end

@implementation JSComposeButton

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        [self prepareComposeButtonViewWithTitle:(NSString *)title imageName:(NSString *)imageName];
    }
    return self;
}

- (void)prepareComposeButtonViewWithTitle:(NSString *)title imageName:(NSString *)imageName {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.imageView];
    [self addSubview:self.label];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(0);
        make.bottom.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
    }];
    
    self.imageView.image = [UIImage imageNamed:imageName];
    self.label.text = title;
}

#pragma mark 
#pragma mark - lazy

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

@end
