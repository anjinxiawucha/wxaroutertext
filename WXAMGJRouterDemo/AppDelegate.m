//
//  AppDelegate.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    [self defaultConfiguration];
    
    return YES;
}

- (void)defaultConfiguration{
    
    NSString    *controllerName         = [WXARouterManager getDataWithRegisterURL:@"WXA://tabBarVC/?VC1=WXAHomeController&VC2=WXAShopController&VC3=WXADetailController&VC4=WXAMineController"];
    self.window                         = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController      = [[NSClassFromString(controllerName) alloc] init];
    self.window.backgroundColor         = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

@end
