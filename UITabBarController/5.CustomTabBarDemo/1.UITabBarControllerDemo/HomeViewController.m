//
//  HomeViewController.m
//  1.UITabBarControllerDemo
//
//  Created by 周泉 on 13-2-16.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import "MainViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
    }
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    view.backgroundColor = [UIColor redColor];
    self.view = view;
    [view release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftItem release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 100, 140, 40)];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MainViewController *tabBarController = (MainViewController *)self.tabBarController;
    [tabBarController showTabBar];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)push
{
    DetailViewController *vc5 = [[[DetailViewController alloc] init] autorelease];
    [self.navigationController pushViewController:vc5 animated:YES];
}

@end
