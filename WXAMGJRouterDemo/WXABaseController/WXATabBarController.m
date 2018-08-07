//
//  WXATabBarController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXATabBarController.h"
#import "WXANavigationController.h"

#import "WXAHomeController.h"
#import "WXAShopController.h"
#import "WXADetailController.h"
#import "WXAMineController.h"

@interface WXATabBarController ()

@end

@implementation WXATabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVC:[[WXAHomeController alloc] init] title:@"首页" image:@"home_icon_home" selectedImage:@"home_icon_home_sel"];
    [self addChildVC:[[WXAShopController alloc] init] title:@"商店" image:@"home_icon_school" selectedImage:@"home_icon_school_sel"];
    [self addChildVC:[[WXADetailController alloc] init] title:@"孩子详情" image:@"home_icon_children" selectedImage:@"home_icon_children_sel"];
    [self addChildVC:[[WXAMineController alloc] init] title:@"我的" image:@"home_icon_me" selectedImage:@"home_icon_me_sel"];
    
}

- (void)addChildVC:(__kindof UIViewController *)childVC
             title:(nonnull NSString *)title
             image:(nonnull NSString *)image
     selectedImage:(nonnull NSString *)selectedImage
{
    childVC.title                           = title;
    childVC.tabBarItem.image                = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage        = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    WXANavigationController *navigationVC   = [[WXANavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:navigationVC];
    
}





@end
