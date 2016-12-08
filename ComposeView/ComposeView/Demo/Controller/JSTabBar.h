//
//  JSTabBar.h
//  ComposeView
//
//  Created by ShenYj on 2016/12/8.
//  Copyright © 2016年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSTabBar;

@protocol JSTabBarComposeDelegate <NSObject>

- (void)tabBar:(JSTabBar *)tabBar withComposeButtonClick:(UIButton *)composeButton;

@end

@interface JSTabBar : UITabBar

@property (weak,nonatomic) id <JSTabBarComposeDelegate> composeDelegate;

@end
