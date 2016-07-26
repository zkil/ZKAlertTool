//
//  ZKAlertTool.h
//  ZKAlertTool
//
//  Created by lee on 16/7/26.
//  Copyright © 2016年 sanchun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewController(topViewController)<UIAlertViewDelegate>
- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void(^)(NSUInteger index))handler;

- (void)showAlertWithMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void(^)(NSUInteger index))handler;
- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;
- (void)showAlert1WithMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;
- (void)showAlert2WithMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;



//普通提示弹窗
- (void)showAlertWithMsg:(NSString *)msg;
- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg;


+ (UIViewController *)topViewController;
- (UIViewController *)topViewController;
@end

@interface ZKAlertTool : NSObject<UIAlertViewDelegate>
+ (instancetype)shareAlertTool;


+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void(^)(NSUInteger index))handler;

+ (void)showAlertWithMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void(^)(NSUInteger index))handler;
+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;
+ (void)showAlert1WithMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;
+ (void)showAlert2WithMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;


//普通提示弹窗
+ (void)showAlertWithMsg:(NSString *)msg;
+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg;


- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void(^)(NSUInteger index))handler;

- (void)showAlertWithMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void(^)(NSUInteger index))handler;
- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;
- (void)showAlert1WithMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;
- (void)showAlert2WithMsg:(NSString *)msg handler:(void(^)(NSUInteger index))handler;


//普通提示弹窗
- (void)showAlertWithMsg:(NSString *)msg;
- (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg;
@end
