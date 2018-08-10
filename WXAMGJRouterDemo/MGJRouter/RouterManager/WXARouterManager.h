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
 @param completion 对调用者传递过来的数据做处理
 */
+ (void)registerURL:(NSString *)url
           forClass:(Class)myclass
         completion:(void(^)(NSDictionary *))completion;

/**
 注册且返回给调用者数据
 
 @param url url
 @param data data
 @param completion 将data传递给调用者
 */
+ (void)registerURL:(NSString *)url
               Data:(id)data
         completion:(void (^)(NSDictionary *))completion;
/**
 push

 @param url url
 */
+ (void)pushWithUrl:(NSString *)url;

/**
 push

 @param url url
 @param dataInfo 数据
 */
+ (void)pushWithUrl:(NSString *)url withDataInfo:(NSDictionary *)dataInfo;

/**
 present

 @param url url
 */
+ (void)presentWithUrl:(NSString *)url;

/**
 获取注册者的数据

 @param url url
 @return 数据
 */
+ (id)getDataWithRegisterURL:(NSString *)url;




/**
 拼接URL和参数(注意:参数为字典)

 @param urlStr urltrl
 @param parameters 参数
 @return 带参数的Url
 */
+ (NSString *)generateWithURL:(NSString *)urlStr parameters:(NSArray <NSDictionary *> *)parameters;
@end
