//
//  WXARouterManager.m
//  WXAMGJRouterDemo
//
//  Created by 吴晓安 on 2018/8/9.
//  Copyright © 2018年 WXA. All rights reserved.
//  路由跳转管理器

#import "WXARouterManager.h"

static NSString *kPrefixRouterString = @"WXA://";

@implementation WXARouterManager

+ (void)registerURL:(NSString *)url forClass:(Class)myclass{
    
    [self registerURL:url forClass:myclass completion:nil];
}

+ (void)registerURL:(NSString *)url
           forClass:(Class)myclass
         completion:(void (^)(NSDictionary*))completion
{
    if ([self checkUrl:url] == NO) {
        return;
    }
    if ([self checkClass:myclass] == NO) {
        return;
    }
    [MGJRouter registerURLPattern:url toObjectHandler:^id(NSDictionary *routerParameters) {
        if (completion) {
        completion(routerParameters);
        }
        return NSStringFromClass(myclass);
    }];
}

+ (id)getDataWithRegisterURL:(NSString *)url
{
    
    if ([self checkUrl:url] == NO) {
        return nil;
    }
    id data = [MGJRouter objectForURL:url];
    return data;
}

+ (void)registerURL:(NSString *)url
               Data:(id)data
         completion:(void (^)(NSDictionary *))completion
{
    if ([self checkUrl:url] == NO) {
        return;
    }
    [MGJRouter registerURLPattern:url toObjectHandler:^id(NSDictionary *routerParameters) {
        if (completion) {
            completion(routerParameters);
        }
        return data;
    }];
    
}

#pragma mark - push or present

// push方式跳转
+ (void)pushWithUrl:(NSString *)url {
    [self pushWithUrl:url withDataInfo:nil];
}

+ (void)pushWithUrl:(NSString *)url withDataInfo:(NSDictionary *)dataInfo{
    
    if (![self checkUrl:url]) {
        return;
    }
    NSString *controllerName            = [MGJRouter objectForURL:url withUserInfo:dataInfo];
    UIViewController *targetController  = [[NSClassFromString(controllerName) alloc] init];
    UIViewController *currentVc         = WXAVisibalController();
    [currentVc.navigationController pushViewController:targetController animated:YES];
}

// present方式跳转
+ (void)presentWithUrl:(NSString *)url {
    if ([self checkUrl:url] == NO) {
        return;
    }
    
    NSString *controllerName = [MGJRouter objectForURL:url];
    UIViewController *targetController = [[NSClassFromString(controllerName) alloc] init];
    
    UIViewController *currentVc = WXAVisibalController();
    [currentVc presentViewController:targetController animated:YES completion:nil];
}


#pragma mark - private

UIViewController* WXAFindTopModelViewController(UIViewController* vc){
    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
    }
    if ([vc isKindOfClass:[UINavigationController class]]) {
        vc = [(UINavigationController*)vc visibleViewController];
    }
    return vc;
}

UIViewController* WXAVisibalController() {
    UIViewController* appRootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    if ([appRootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tableBarVC = (UITabBarController*)appRootViewController;
        UIViewController *selectController=(UIViewController *)tableBarVC.selectedViewController;
        return WXAFindTopModelViewController(selectController);
    }else {
        return WXAFindTopModelViewController(appRootViewController);
    }
}

+ (NSString *)generateWithURL:(NSString *)urlStr parameters:(NSArray<NSDictionary *> *)parameters{
    if (![self checkUrl:urlStr]) {
        return nil;
    }
     urlStr = [urlStr stringByAppendingString:@"/?"];
    if (parameters.count) {
        for (NSDictionary *dic in parameters) {
            urlStr = [urlStr stringByAppendingString:[self convertToJsonData:dic]];
        }
        return urlStr;
    }
    return nil;
}

+ (NSString *)convertToJsonData:(NSDictionary *)dict

{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    NSRange range3 = {0, mutStr.length};
    [mutStr replaceOccurrencesOfString:@":" withString:@"=" options:NSLiteralSearch range:range3];
    NSRange range4 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"," withString:@"&" options:NSLiteralSearch range:range4];
    NSRange range5 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"\"" withString:@"" options:NSLiteralSearch range:range5];
    NSRange range6 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"{" withString:@"" options:NSLiteralSearch range:range6];
    NSRange range7 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"}" withString:@"" options:NSLiteralSearch range:range7];
    return mutStr;
}
//检查url
+ (BOOL)checkUrl:(NSString *)url {
    if (!url || url.length ==0) {
        NSLog(@"url is null, push or  fail");
        return NO;
    }
    
    if (![url hasPrefix:kPrefixRouterString]) {
        NSLog(@"url format is error, has no %@",kPrefixRouterString);
        return NO;
    }
    return YES;
}

/// 检查class
+ (BOOL)checkClass:(Class)myclass {
    if (!myclass) {
        NSLog(@"class is nil,");
        return NO;
    }
    return YES;
}

@end
