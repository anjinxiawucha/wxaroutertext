//
//  WXADetailController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXADetailController.h"

@interface WXADetailController ()

@end

@implementation WXADetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSString *controllerName    = [MGJRouter objectForURL:@"WXA://home/homeCell"];
    [self.navigationController pushViewController:[[NSClassFromString(controllerName) alloc] init] animated:YES];
    
}

@end
