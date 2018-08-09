//
//  WXAMineController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//  个人中心控制器

#import "WXAMineController.h"

@interface WXAMineController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nullable, nonatomic, strong)     UITableView     *tableView;

@end

@implementation WXAMineController


+ (void)load{
    
    [WXARouterManager registerURL:@"WXA://minVC" forClass:[self class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableViewDefuleConfig];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 4) {
        [WXARouterManager pushWithUrl:@"WXA://mineChildVC"];
    }
    if (indexPath.row == 5) {
        id  data  = [WXARouterManager getDataWithRegisterURL:@"WXA://mineChild/data"];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.textLabel.text   = data;
    }
}

- (void)tableViewDefuleConfig{
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell     *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text       = [NSString stringWithFormat:@"minVC -- num %zd",indexPath.row];
    return cell;
}

- (nullable UITableView *)tableView{
    
    if (!_tableView) {
        _tableView              = [[UITableView alloc] initWithFrame:CGRectMake(0, 64,self.view.frame.size.width , self.view.frame.size.height - 64 -49)];
        _tableView.delegate     = self;
        _tableView.dataSource   = self;
    }
    return _tableView;
}


@end
