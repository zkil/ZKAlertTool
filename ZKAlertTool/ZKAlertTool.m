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

+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void(^)(NSUInteger index))handler {
    [[ZKAlertTool shareAlertTool]showAlertWithTitle:title andMsg:msg cancelTitle:cancelTitle otherTitles:otherTitles handler:handler];
}

+ (void)showAlertWithMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void(^)(NSUInteger index))handler{
    [[ZKAlertTool shareAlertTool]showAlertWithMsg:msg cancelTitle:cancelTitle otherTitles:otherTitles handler:handler];
}

+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler {
    [[ZKAlertTool shareAlertTool] showAlertWithTitle:title andMsg:msg handler:handler];
}

+ (void)showAlert1WithMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler {
    [[ZKAlertTool shareAlertTool] showAlert1WithMsg:msg handler:handler];
}

+ (void)showAlert2WithMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler {
    [[ZKAlertTool shareAlertTool]showAlert2WithMsg:msg handler:handler];
}

+ (void)showAlertWithMsg:(NSString *)msg {
    [[ZKAlertTool shareAlertTool]showAlertWithMsg:msg];
}

+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg {
    [[ZKAlertTool shareAlertTool]showAlertWithTitle:title andMsg:msg];
}

/***************************/

- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler {
    [[UIViewController zk_topViewController] showAlertWithTitle:title andMsg:msg cancelTitle:cancelTitle otherTitles:otherTitles handler:handler];
}

- (void)showAlertWithMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler {
    [self showAlertWithTitle:nil andMsg:msg cancelTitle:cancelTitle otherTitles:otherTitles handler:handler];
}

- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [self showAlertWithTitle:title andMsg:msg cancelTitle:NSLocalizedString(@"取消", nil) otherTitles:@[NSLocalizedString(@"确定", nil)] handler:handler];
}

- (void)showAlert1WithMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [self showAlertWithTitle:nil andMsg:msg cancelTitle:NSLocalizedString(@"取消", nil) otherTitles:@[NSLocalizedString(@"确定", nil)] handler:handler];
}

- (void)showAlert2WithMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler {
    [self showAlertWithTitle:nil andMsg:msg cancelTitle:NSLocalizedString(@"確定", nil) otherTitles:nil handler:handler];
}



- (void)showAlertWithMsg:(NSString *)msg {
    [self showAlertWithTitle:nil andMsg:msg cancelTitle:NSLocalizedString(@"确定", nil) otherTitles:nil handler:nil];
}

- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg {
    [self showAlertWithTitle:title andMsg:msg cancelTitle:NSLocalizedString(@"确定", nil) otherTitles:nil handler:nil];
}



@end
