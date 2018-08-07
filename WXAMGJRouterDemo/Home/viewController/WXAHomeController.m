//
//  WXAHomeController.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/6.
//  Copyright © 2018年 WXA. All rights reserved.
//  首页控制器

#import "WXAHomeController.h"

@interface WXAHomeController ()
<
  UITableViewDelegate,
  UITableViewDataSource
>

@property (nullable, nonatomic, strong)     UITableView     *tableView;


@end

@implementation WXAHomeController

+ (void)load{
    
    [MGJRouter registerURLPattern:@"WXA://home" toObjectHandler:^id(NSDictionary *routerParameters) {
        return NSStringFromClass(self);
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableViewConfig];
}
/*********************************************DELEGATE***********************************************/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
      NSString *controllerName = [MGJRouter objectForURL:@"WXA://home/homeCell"];
      [self.navigationController pushViewController:[[NSClassFromString(controllerName) alloc] init] animated:YES];
    
}

/*********************************************PUBLIC*************************************************/
- (void)tableViewConfig{
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"cell num - %zd",indexPath.row];
    return cell;
}

/***************************************************GET**********************************************/

- (nullable UITableView *)tableView{
    
    if (!_tableView) {
        _tableView              = [[UITableView alloc] initWithFrame:CGRectMake(0, 64,self.view.frame.size.width , self.view.frame.size.height - 64 -49)];
        _tableView.delegate     = self;
        _tableView.dataSource   = self;
    }
    return _tableView;
}

@end
