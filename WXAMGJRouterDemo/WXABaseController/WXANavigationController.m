//
//  WXANavigationController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXANavigationController.h"

@interface WXANavigationController ()

@end

@implementation WXANavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Override
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}


@end
