//
//  WXARouterManager.h
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/9.
//  Copyright © 2018年 WXA. All rights reserved.
//  路由跳转管理器

#import <UIKit/UIKit.h>
#import "MGJRouter.h"
@interface WXARouterManager : NSObject



/**
 注册

 @param url url
 @param myclass 注册者
 */
+ (void)registerURL:(NSString *)url forClass:(Class)myclass;
/**
 注册

 @param url url
 @param myclass 注册者
 @param completion 回调
 */
+ (void)registerURL:(NSString *)url
           forClass:(Class)myclass
         completion:(void(^)(NSDictionary *routerParameters))completion;
/**
 push

 @param url url
 */
+ (void)pushWithUrl:(NSString *)url;
/**
 present

 @param url url
 */
+ (void)presentWithUrl:(NSString *)url;
/**
 注册且返回给调用者数据

 @param url url
 @param data data
 @param completion 注册这执行
 */
+ (void)registerURL:(NSString *)url
               Data:(id)data
         completion:(void (^)(NSDictionary *routerParameters))completion;
/**
 获取注册者的数据

 @param url url
 @return 数据
 */
+ (id)getDataWithRegisterURL:(NSString *)url;


@end
