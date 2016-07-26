//
//  ZKAlertTool.m
//  ZKAlertTool
//
//  Created by lee on 16/7/26.
//  Copyright © 2016年 sanchun. All rights reserved.
//

#import "ZKAlertTool.h"
#import <objc/runtime.h>

#define KALERK_VIEW_KEY "KALERK_VIEW_KEY"



@implementation UIViewController(topViewController)

+ (UIViewController *)topViewController{
    return [UIApplication sharedApplication].keyWindow.rootViewController.topViewController;
}

- (UIViewController *)topViewController{
    UIViewController *viewC = nil;
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigC = (UINavigationController *)self;
        viewC = navigC.topViewController;
        viewC =  [viewC topViewController];
    }else if([self isKindOfClass:[UITabBarController class]]){
        UITabBarController *tabC = (UITabBarController *)self;
        viewC = tabC.selectedViewController;
        viewC = [viewC topViewController];
    }else if(self.presentedViewController != nil){
        viewC = self.presentedViewController;
        viewC = [viewC topViewController];
    }else{
        viewC = self;
    }
    return viewC;
}

- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler {
#ifdef __IPHONE_8_0
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler != nil) {
            handler(0);
        }
    }];
    [alertController addAction:cancelAction];
    [otherTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler != nil) {
                handler(idx + 1);
            }
            
        }];
        [alertController addAction:otherAction];
    }];
    [self presentViewController:alertController animated:YES completion:nil];
    
#else
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:nil];
    for (NSString *otherTitle in otherTitles) {
        [alertView addButtonWithTitle:otherTitle];
    }
    //建立关联 关联对象 key 值 对象关联策略
    if (handler != nil) {
        objc_setAssociatedObject(alertView, kAlertToolKey, handler, OBJC_ASSOCIATION_COPY);
    }
    
    [alertView show];
#endif
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



#pragma -mark- UIAlertDelegate

#ifndef __IPHONE_8_0
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //获得关联
    void(^block)(NSInteger index) = objc_getAssociatedObject(alertView, KALERK_VIEW_KEY);
    if (block != nil) {
        block(buttonIndex);
    }
}

#endif


@end


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
#ifdef __IPHONE_8_0
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler != nil) {
            handler(0);
        }
    }];
    [alertController addAction:cancelAction];
    [otherTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler != nil) {
                handler(idx + 1);
            }
            
        }];
        [alertController addAction:otherAction];
    }];
    [[UIViewController topViewController] presentViewController:alertController animated:YES completion:nil];
    
#else
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:nil];
    for (NSString *otherTitle in otherTitles) {
        [alertView addButtonWithTitle:otherTitle];
    }
    //建立关联 关联对象 key 值 对象关联策略
    if (handler != nil) {
        objc_setAssociatedObject(alertView, kAlertToolKey, handler, OBJC_ASSOCIATION_COPY);
    }
    
    [alertView show];
#endif
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



#pragma -mark- UIAlertDelegate

#ifndef __IPHONE_8_0
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //获得关联
    void(^block)(NSInteger index) = objc_getAssociatedObject(alertView, KALERK_VIEW_KEY);
    if (block != nil) {
        block(buttonIndex);
    }
}

#endif

@end