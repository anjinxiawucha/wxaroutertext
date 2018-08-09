//
//  WXAMIneChildController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/7.
//  Copyright © 2018年 WXA. All rights reserved.
//

#import "WXAMIneChildController.h"

@interface WXAMIneChildController ()

@property (nonatomic, nullable, copy) NSString      *name;

@end

@implementation WXAMIneChildController

+ (void)load{
    
    [WXARouterManager registerURL:@"WXA://mineChildVC" forClass:[self class]];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [MGJRouter registerURLPattern:@"WXA://mineChild/data" toObjectHandler:^id(NSDictionary *routerParameters) {
        return self.name;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.name = @"tom";
    self.title = @"MineChildVC";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text   = [NSString stringWithFormat:@"MinChild - num%zd",indexPath.row];
    return cell;
}




@end
