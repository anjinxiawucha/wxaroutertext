//
//  WXAHomeCellDetailController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXAHomeCellDetailController.h"

@interface WXAHomeCellDetailController ()

@property (nonatomic) SEL selectedSelector;

@property (nonatomic, nullable, strong) NSDictionary *routerParameters;

@end



@implementation WXAHomeCellDetailController

+ (void)load{
    
    [MGJRouter registerURLPattern:@"WXA://home/homeCell" toObjectHandler:^id(NSDictionary *routerParameters) {
        return NSStringFromClass(self);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"push is finshed");
}

@end
