//
//  AppDelegate.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "AppDelegate.h"
#import "WXATabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    [self defaultConfiguration];
    
    return YES;
}

- (void)defaultConfiguration{
    
    self.window                         = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];    
    WXATabBarController  *tabController = [[WXATabBarController alloc] init];
    self.window.rootViewController      = tabController;
    self.window.backgroundColor         = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

@end
