//
//  RootViewController.m
//  1.SimpleNavigationDemo
//
//  Created by 周泉 on 13-2-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    UIView *baseView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    baseView.backgroundColor = [UIColor purpleColor];
    self.view = baseView;
    [baseView release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 100, 140, 40)];
    [button addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
#pragma 手势监听:单击还是双击
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    
    //给self.view添加一个手势监测；
    
    [self.view addGestureRecognizer:singleRecognizer];
    
    
    // 双击的 Recognizer
    UITapGestureRecognizer* doubleRecognizer;
    doubleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(DoubleTap:)];
    doubleRecognizer.numberOfTapsRequired = 2; // 双击
    
    [self.view addGestureRecognizer:doubleRecognizer];
    
    // 关键在这一行，双击手势确定监测失败才会触发单击手势的相应操作
    [singleRecognizer requireGestureRecognizerToFail:doubleRecognizer];
    [singleRecognizer release];
    [doubleRecognizer release];

}

-(void)SingleTap:(UITapGestureRecognizer*)recognizer
{
    //处理单击操作
}

-(void)DoubleTap:(UITapGestureRecognizer*)recognizer
{
    [self hiddenOrShow];
    //处理双击操作
    NSLog(@"2");
}

#pragma mark - Target Action
- (void)hiddenOrShow
{
    if (self.navigationController.navigationBarHidden) {
        // 显示ToolBar和NavigationBar
        //        [self.navigationController setToolbarHidden:NO animated:YES];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else {
        //        [self.navigationController setToolbarHidden:YES animated:YES];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 默认是隐藏的
    [self.navigationController setToolbarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Target Action
- (void)pushVC
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC release];
}

@end
