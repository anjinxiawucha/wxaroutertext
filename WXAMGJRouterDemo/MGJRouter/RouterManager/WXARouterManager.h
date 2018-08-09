//
//  WXARouterManager.h
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/9.
//  Copyright © 2018年 WXA. All rights reserved.
//  路由跳转管理器

#import <UIKit/UIKit.h>

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


@end
