//
//  WXAPushViewControllerURL.h
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/7.
//  Copyright © 2018年 WXA. All rights reserved.
//  各模块控制器跳转

#ifndef WXAPushViewControllerURL_h
#define WXAPushViewControllerURL_h

/*
 *首页模块:WXA://home
 */
#import "WXAHomeController.h"
/*
 首页模块cell行情:  WXA://home/homeCell
 */
#import "WXAHomeCellDetailController.h"

/*
 *商店模块:WXA://shop
 */
#import "WXAShopController.h"

/*
 *商店模块:WXA://shop/childViewController
 */
#import "WXAShopChildController.h"

/*
 *个人中心模块:WXA://minVC
 */
#import "WXAMineController.h"

/*
 *个人中心模块:WXA://mineChildVC
 */
#import "WXAMIneChildController.h"

/*
 *获取子模块的数据
 *个人中心模块:WXA://mineChild/data
 */
#import "WXAMIneChildController.h"


#endif /* WXAPushViewControllerURL_h */
