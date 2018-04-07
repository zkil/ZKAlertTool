//
//  ViewController.m
//  ZKAlertTool
//
//  Created by lee on 16/7/26.
//  Copyright © 2016年 sanchun. All rights reserved.
//

#import "ViewController.h"
#import "ZKAlertTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSArray *)items {
    if (_items == nil) {
        _items = @[
                   @"msg",
                   @"title msg",
                   @"msg 事件",
                   @"title msg 按鈕事件"
                   ];
    }
    return _items;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            [ZKAlertTool showAlertWithMsg:@"msg"];
        }
            break;
        case 1: {
            [ZKAlertTool showAlertWithTitle:@"title" andMsg:@"msg"];
        }
            break;
        case 2: {
            [ZKAlertTool showAlert1WithTitle:@"title" andMsg:@"msg" handler:^(NSUInteger index) {
                NSLog(@"tounch %ld",index);
            }];
        }
            break;
            
            
        default: {
            [ZKAlertTool showAlertWithTitle:@"title" andMsg:@"msg" cancelTitle:@"cacel" otherTitles:@[@"1",@"2",@"3",@"4"] handler:^(NSUInteger index) {
                NSLog(@"tounch %ld",index);
            }];
        }
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
