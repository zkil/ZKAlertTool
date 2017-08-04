# ZKAlertTool
  
## 简介:  
基于原生警告框封装，ios8下使用UIAlertView，以上使用UIAlertController  
## 使用方法  
### 导入  
`#import "ZKAlertTool.h"`

### 在任何地方弹出警告框  
```
[ZKAlertTool showAlertWithTitle:@"title" andMsg:@"msg" cancelTitle:@"cacel" otherTitles:@[@"1",@"2",@"3",@"4"] handler:^(NSUInteger index) {
        NSLog(@"tounch %ld",index);
}];
```

如果只想显示描述，不处理事件
```
[ZKAlertTool showAlertWithMsg:@"msg"];
```  
类似其他不需要的值方法查看 `ZKAlertTool.h`

### 在指定viewController中弹出警告框
类似上面，把ZKAlertTool 换成self即可, 详细查看 `"UIViewController+zk_Additions.h`  

```
[self showAlertWithTitle:@"title" andMsg:@"msg" cancelTitle:@"cacel" otherTitles:@[@"1",@"2",@"3",@"4"] handler:^(NSUInteger index) {
        NSLog(@"tounch %ld",index);
}];
```

### 获取顶层控制器
```
[UIViewController zk_topViewController];
```
或在ViewContoller中  
```
[self zk_topViewController];
```

 