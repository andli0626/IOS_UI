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
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0.0, 0.0, 50.0, 44.0);
        //top_navigation_menuicon_
        //top_navigation_back_highlighted
        //infobutton
        [backButton setImage:[UIImage imageNamed:@"top_navigation_back.png"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"top_navigation_back_highlighted.png"] forState:UIControlStateSelected];
        [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
        self.navigationItem.leftBarButtonItem=temporaryBarButtonItem;
        [temporaryBarButtonItem release];
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
