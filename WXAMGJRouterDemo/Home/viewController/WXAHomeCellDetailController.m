//
//  WXAHomeCellDetailController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXAHomeCellDetailController.h"

@interface WXAHomeCellDetailController ()

@end

@implementation WXAHomeCellDetailController

+ (void)load{
    
    [WXARouterManager registerURL:@"WXA://home/homeCell" forClass:[self class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"push is finshed");
}

@end
