//
//  ZKAlertTool.h
//  ZKAlertTool
//
//  Created by lee on 16/7/26.
//  Copyright © 2016年 sanchun. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UIViewController+zk_Additions.h"

@interface ZKAlertTool : NSObject<UIAlertViewDelegate>
+ (instancetype)shareAlertTool;


/**
 弹出一个警告框,包含标题，信息，取消按钮，其他按钮和事件处理
 
 @param title 标题
 @param msg 信息
 @param cancelTitle 取消按钮标题
 @param otherTitles 其他标题数组
 @param handler 事件处理
 */
+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler;


/**
 弹出警告框,包含信息，取消按钮，其他按钮和事件处理
 
 @param msg 信息
 @param cancelTitle 取消按钮标题
 @param otherTitles 其他按钮标题
 @param handler 事件处理
 */
+ (void)showAlertWithMsg:(NSString *)msg cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray *)otherTitles handler:(void (^)(NSUInteger))handler;



/**
 弹出警告框，包含标题，信息，确认按钮，取消按钮，事件处理
 
 @param title 标题
 @param msg 信息
 @param handler 事件处理
 */
+ (void)showAlert1WithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler;
/**
 弹出警告框，包含标题，信息，确认按钮，事件处理
 
 @param title 标题
 @param msg 信息
 @param handler 事件处理
 */
+ (void)showAlert2WithTitle:(NSString *)title andMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler;

/**
 弹出警告框，包含信息，确认按钮，取消按钮，事件处理
 
 @param msg 信息
 @param handler 事件处理
 */
+ (void)showAlert1WithMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler;
/**
 弹出警告框，包含信息，确认按钮，事件处理
 
 @param msg 信息
 @param handler 事件处理
 */
+ (void)showAlert2WithMsg:(NSString *)msg handler:(void (^)(NSUInteger))handler;

/**
 弹出警告框，包含信息，确认按钮
 
 @param msg 信息
 */
+ (void)showAlertWithMsg:(NSString *)msg;

/**
 弹出警告框，包含标题，信息，确认按钮
 
 @param title 标题
 @param msg 信息
 */
+ (void)showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg;
@end
