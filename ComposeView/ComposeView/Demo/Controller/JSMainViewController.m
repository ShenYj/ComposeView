//
//  JSMainViewController.m
//  ComposeView
//
//  Created by ShenYj on 2016/12/8.
//  Copyright © 2016年 ShenYj. All rights reserved.
//

#import "JSMainViewController.h"
#import "ViewController.h"
#import "JSComposeView.h"

@implementation JSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JSTabBar *tabBar = [[JSTabBar alloc] init];
    tabBar.composeDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    for (int i = 0; i < 4; i ++) {
        [self addChildViewControllerWithTag:i];
    }
    
}

- (void)addChildViewControllerWithTag:(int)tag {

    ViewController *VC = [[ViewController alloc] init];
    VC.view.backgroundColor = [UIColor whiteColor];
    VC.title = [NSString stringWithFormat:@"demo%@",@(tag).description];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
}

#pragma mark
#pragma mark - JSTabBarComposeDelegate
- (void)tabBar:(JSTabBar *)tabBar withComposeButtonClick:(UIButton *)composeButton {
    
    JSComposeView *composeView = [[JSComposeView alloc] init];
    __weak typeof(self) weakSelf = self;
    [composeView showComposeViewWithCompeletionHandler:^(NSString *clsName) {
        Class class = NSClassFromString(clsName);
        UIViewController *viewController = [[class alloc] init];
        [weakSelf presentViewController:viewController animated:YES completion:nil];
    }];
    
}

@end
