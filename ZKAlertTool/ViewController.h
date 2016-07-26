//
//  ViewController.h
//  ZKAlertTool
//
//  Created by lee on 16/7/26.
//  Copyright © 2016年 sanchun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *items;

@end

