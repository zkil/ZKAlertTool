//
//  ZKAlertTool.m
//  ZKAlertTool
//
//  Created by lee on 16/7/26.
//  Copyright © 2016年 sanchun. All rights reserved.
//

#import "ZKAlertTool.h"
#import <objc/runtime.h>


static ZKAlertTool *alertTool = nil;
static dispatch_once_t once;

@implementation ZKAlertTool
+ (instancetype)shareAlertTool {
    dispatch_once(&once, ^{
        alertTool = [[[self class]alloc]init];
    });
    return alertTool;
}

+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler {
    [[ZKAlertTool shareAlertTool] showAlertWithTitle:title andMsg:msg cancelTitle:cancelTitle otherTitles:otherTitles handler:handler];
}

+ (void)showAlertWithMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler {
    [[ZKAlertTool shareAlertTool] showAlertWithMsg:msg cancelTitle:cancelTitle otherTitles:otherTitles handler:handler];
}

+ (void)showAlert1WithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [[ZKAlertTool shareAlertTool] showAlert1WithTitle:title andMsg:msg handler:handler];
}

+ (void)showAlert2WithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [[ZKAlertTool shareAlertTool] showAlert2WithTitle:title andMsg:msg handler:handler];
}

+ (void)showAlert1WithMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [[ZKAlertTool shareAlertTool] showAlert1WithMsg:msg handler:handler];
}

+ (void)showAlert2WithMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [[ZKAlertTool shareAlertTool] showAlert2WithMsg:msg handler:handler];
}

+ (void)showAlertWithMsg:(NSString *)msg {
    [[ZKAlertTool shareAlertTool] showAlertWithMsg:msg];
}

+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg {
    [[ZKAlertTool shareAlertTool] showAlertWithTitle:title andMsg:msg];
}

/***************************/

- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler {
    [[UIViewController zk_topViewController] showAlertWithTitle:title andMsg:msg cancelTitle:cancelTitle otherTitles:otherTitles handler:handler];
}

- (void)showAlertWithMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler {
    [[UIViewController zk_topViewController] showAlertWithMsg:msg cancelTitle:cancelTitle otherTitles:otherTitles handler:handler];
}

- (void)showAlert1WithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [[UIViewController zk_topViewController] showAlert1WithTitle:title andMsg:msg handler:handler];
}

- (void)showAlert2WithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [[UIViewController zk_topViewController] showAlert2WithTitle:title andMsg:msg handler:handler];
}

- (void)showAlert1WithMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [[UIViewController zk_topViewController] showAlert1WithMsg:msg handler:handler];
}

- (void)showAlert2WithMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [[UIViewController zk_topViewController] showAlert2WithMsg:msg handler:handler];
}



- (void)showAlertWithMsg:(NSString *)msg {
    [[UIViewController zk_topViewController] showAlertWithMsg:msg];
}

- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg {
    [[UIViewController zk_topViewController] showAlertWithTitle:title andMsg:msg];
}




@end
