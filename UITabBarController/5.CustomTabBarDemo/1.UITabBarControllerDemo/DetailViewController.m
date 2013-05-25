//
//  DetailViewController.m
//  1.UITabBarControllerDemo
//
//  Created by 周泉 on 13-2-17.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import "DetailViewController.h"
#import "MainViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"内容";
        
        self.hidesBottomBarWhenPushed = YES;//隐藏底部TabBar
        
    }
    return self;
}

- (void)loadView
{
    // NSLog(@"%s", __FUNCTION__);
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    view.backgroundColor = [UIColor cyanColor];
    self.view = view;
    [view release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    MainViewController *tabBarController = (MainViewController *)self.tabBarController;
    [tabBarController hiddenTabBar];
}

@end
