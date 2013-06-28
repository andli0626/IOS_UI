//
//  RootView.m
//  NavigationDemo
//
//  Created by 李林 on 13-3-31.
//  Copyright (c) 2013年 李林. All rights reserved.
//

#import "RootView.h"

@interface RootView ()

@end

@implementation RootView


- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)loadView{
    UIView *baseView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    baseView.backgroundColor = [UIColor purpleColor];//紫色
    self.view = baseView;
    [baseView release];
    
    self.title = @"根视图";
    
    //代码添加一个Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 100, 140, 40)];
    [button addTarget:self
               action:@selector(pushVC)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

    
    //自定义左导航Item
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks//系统样式
                                 target:self
                                 action:@selector(clickLeftItem)];
    
    /*
     * @ 一个导航控制器控制着若干个视图控制器
     *   一个导航控制器包含一个NavigationBar和一个toolBar
     *   NavigationBar中的"按钮"是一个UINavigationItem（only one）
     *   通过设置UINavigationItem的属性，显示Item（UInavigatinBar）
     *   UINavigationItem不是由navigationBar控制，更不由UInavigtaionController来控制
     *   而是由当前的视图控制器控制
     */
    
    // 错误的写法
 
//    self.navigationController.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftItem release];
    
    
    //自定义右导航Item
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [itemButton setTitle:@"测试" forState:UIControlStateNormal];
    [itemButton setFrame:CGRectMake(0, 0, 60, 40)];
    [itemButton addTarget:self
               action:@selector(clickRightItem)
     forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:itemButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    
    //自定义导航titleView
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    testView.backgroundColor = [UIColor orangeColor];
  
    self.navigationItem.titleView = testView;
    [testView release];
    
    //显示工具栏
//    [self.navigationController setToolbarHidden:NO animated:YES];
    
    //自定义工具栏
    UIToolbar *toolbar =[[UIToolbar alloc]initWithFrame:CGRectMake(0, 466-44-44, 320, 44)];
    toolbar.barStyle = UIBarStyleDefault;
    [self.view addSubview:toolbar];
    [toolbar release];
    
    UIBarButtonItem *saveToolItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:nil];
    UIBarButtonItem *editToolItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
    UIBarButtonItem *addToolItem = [[UIBarButtonItem alloc]initWithTitle:@"新增" style:UIBarButtonSystemItemAdd target:self action:nil];
    NSArray *toolitems = @[saveToolItem,editToolItem,addToolItem];
    [toolbar setItems:toolitems];
    
}

#pragma mark - Target Action

-(void)pushVC{
    SecoundView *secound =[[SecoundView alloc]init];
    [self.navigationController pushViewController:secound animated:YES];
    [secound release];
    
}

-(void)clickLeftItem{
    UIAlertView *mDialog = [[UIAlertView alloc]initWithTitle:@"点击左Item" message:@"message" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [mDialog show];
    [mDialog release];
}
-(void)clickRightItem{
    UIAlertView *mDialog = [[UIAlertView alloc]initWithTitle:@"点击右Item" message:@"message" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [mDialog show];
    [mDialog release];
}



@end
