//
//  WXAShopController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXAShopController.h"

@interface WXAShopController ()

@end

@implementation WXAShopController

+ (void)load{
    
    [MGJRouter registerURLPattern:@"WXA://shop" toObjectHandler:^id(NSDictionary *routerParameters) {
        return NSStringFromClass(self);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label              = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 100, 50)];
    label.text                  = @"点击页面跳转";
    label.textColor             = [UIColor blackColor];
    [self.view addSubview:label];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString  *controllerName = [MGJRouter objectForURL:@"WXA://shop/childViewController/?version=230&name=王亚"];
    [self.navigationController pushViewController:[[NSClassFromString(controllerName) alloc]init] animated:YES];
}


@end
