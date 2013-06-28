//
//  SecondViewController.m
//  1.SimpleNavigationDemo
//
//  Created by 周泉 on 13-2-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(IBAction)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
//        UILabel *titleLabel = [[UILabel alloc]init];
//        titleLabel.text = @"上海黄浦";
//        titleLabel.font = [UIFont fontWithName:@"Arial" size:24];
        self.title = @"网易新闻";
//        self.navigationController.title =titleLabel;
        
        //初始化左按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0.0, 0.0, 50, 44.0);
        [backButton setImage:[UIImage imageNamed:@"navigation_back1.png"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigation_back2.png"] forState:UIControlStateSelected];
        [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        //设置左按钮
        UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        leftButtonItem.style = UIBarButtonItemStylePlain;
        self.navigationItem.leftBarButtonItem=leftButtonItem;
        [leftButtonItem release];
        
        //初始化右按钮
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0.0, 0.0, 50.0, 44.0);
        [rightButton setImage:[UIImage imageNamed:@"navigation_set1.png"] forState:UIControlStateNormal];
        [rightButton setImage:[UIImage imageNamed:@"navigation_set2.png"] forState:UIControlStateSelected];
        [rightButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        //设置右按钮
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        rightButtonItem.style = UIBarButtonItemStylePlain;
        self.navigationItem.rightBarButtonItem=rightButtonItem;
        [rightButtonItem release];

        
        
        
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)loadView
{
    UIView *baseView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    baseView.backgroundColor = [UIColor orangeColor];
    self.view = baseView;
    [baseView release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"isHidden" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 150, 140, 40)];
    [button addTarget:self action:@selector(hiddenOrShow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [back setTitle:@"back" forState:UIControlStateNormal];
    [back setFrame:CGRectMake(90, 200, 140, 40)];
    [back addTarget:self action:@selector(backRootVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
//    NSLog(@"second Nav : %p", self.navigationController);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 默认是隐藏的
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Target Action
- (void)hiddenOrShow
{
    if (self.navigationController.toolbarHidden) {
        // 显示ToolBar和NavigationBar
        [self.navigationController setToolbarHidden:NO animated:YES];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else {
        [self.navigationController setToolbarHidden:YES animated:YES];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void)backRootVC
{
    // 返回上一层视图控制器
    [self.navigationController popViewControllerAnimated:YES];
}

@end
