//
//  WXAShopChildController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/7.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXAShopChildController.h"

static NSDictionary *parameters;
@interface WXAShopChildController ()

@property (nullable, nonatomic, strong) UILabel     *label;

@end

@implementation WXAShopChildController


+ (void)load{
    
    [WXARouterManager registerURL:@"WXA://shop/childViewController"
                         forClass:[self class]
                       completion:^(NSDictionary *routerParameters) {
                           parameters = routerParameters;
                       }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title      = @"商店自控制器";
    [self.view addSubview:self.label];
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    data                      = parameters[MGJRouterParameterUserInfo];
    self.label.text           = data[@"name"];
    NSLog(@"parameters = %@",data[@"name"]);
}

- (nullable UILabel *)label{
    
    if (!_label) {
        _label                  = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.width, 50)];
        _label.textColor        = [UIColor blackColor];
        _label.numberOfLines    = 0;
        _label.font             = [UIFont systemFontOfSize:14];
    }
    return _label;
}

@end
