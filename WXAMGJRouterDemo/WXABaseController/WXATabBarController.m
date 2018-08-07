//
//  WXATabBarController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXATabBarController.h"

static NSDictionary *parameters;

@interface WXATabBarController ()

@end

@implementation WXATabBarController

+ (void)load{
    
    [MGJRouter registerURLPattern:@"WXA://tabBarVC" toObjectHandler:^id(NSDictionary *routerParameters) {
        parameters = routerParameters;
        return NSStringFromClass(self);
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *vc1  = parameters[@"VC1"];
    NSString *vc2  = parameters[@"VC2"];
    NSString *vc3  = parameters[@"VC3"];
    NSString *vc4  = parameters[@"VC4"];
    [self addChildVC:[[NSClassFromString(vc1) alloc] init] title:@"首页" image:@"home_icon_home" selectedImage:@"home_icon_home_sel"];
    [self addChildVC:[[NSClassFromString(vc2) alloc] init] title:@"商店" image:@"home_icon_school" selectedImage:@"home_icon_school_sel"];
    [self addChildVC:[[NSClassFromString(vc3) alloc] init] title:@"孩子详情" image:@"home_icon_children" selectedImage:@"home_icon_children_sel"];
    [self addChildVC:[[NSClassFromString(vc4) alloc] init] title:@"我的" image:@"home_icon_me" selectedImage:@"home_icon_me_sel"];
    
}

- (void)addChildVC:(__kindof UIViewController *)childVC
             title:(nonnull NSString *)title
             image:(nonnull NSString *)image
     selectedImage:(nonnull NSString *)selectedImage
{
    childVC.title                           = title;
    childVC.tabBarItem.image                = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage        = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSString *controllerName                = [MGJRouter objectForURL:@"WXA://navigationVC"];
    UINavigationController   *navigationVC  = [[NSClassFromString(controllerName) alloc]initWithRootViewController:childVC];
    [self addChildViewController:navigationVC];
}





@end
