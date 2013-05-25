//
//  MainViewController.m
//  1.UITabBarControllerDemo
//
//  Created by 周泉 on 13-2-17.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MesssageViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"
#import "OtherViewController.h"

@interface MainViewController ()

- (void)loadViewControllers;

- (void)loadCustomTabBarView;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)loadViewControllers
{
    /*
     * 1. 创建若干个子视图控制器（它们是并列的关系）
     *  1.1 创建UITabBarItem实例，赋值给相应的子视图控制器（有可能是导航控制器）
     * 2. 创建一个数组，将已创建的子视图控制器，添加到数组中
     * 3. 创建UITabBarController实例
     * 4. tabBarController.viewControllers = viewControllers;
     * 5. 添加到window的rootViewController中
     */
    
    // 首页
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:vc1];
    [vc1 release];
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    vc1.tabBarItem = homeItem;
    [homeItem release];
    /*
     NSLog(@"vc1 barButtonItem : %p", vc1.navigationItem.leftBarButtonItem);
     NSLog(@"vc1 tabBarItem : %p", vc1.tabBarItem);
     */
    
    // 消息页
    MesssageViewController *vc2 = [[MesssageViewController alloc] init];
    UINavigationController *msgNav = [[UINavigationController alloc] initWithRootViewController:vc2];
    [vc2 release];
    UITabBarItem *msgItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
    vc2.tabBarItem = msgItem;
    [msgItem release];
    
    // 搜索页
    SearchViewController *vc3 = [[SearchViewController alloc] init];
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:vc3];
    [vc3 release];
    UITabBarItem *searchItem = [[UITabBarItem alloc] initWithTitle:@"搜索" image:[UIImage imageNamed:@"alarm"] tag:3];
    vc3.tabBarItem = searchItem;
    [searchItem release];
    
    // 设置页
    SettingViewController *vc4 = [[SettingViewController alloc] init];
    UINavigationController *setNav = [[UINavigationController alloc] initWithRootViewController:vc4];
    [vc4 release];
    UITabBarItem *setItem = [[UITabBarItem alloc] initWithTitle:@"草莓" image:[UIImage imageNamed:@"Strawberry"] tag:4];
    vc4.tabBarItem = setItem;
    [setItem release];
    
    // 其他页
    OtherViewController *vc5 = [[OtherViewController alloc] init];
    UINavigationController *otherNav = [[UINavigationController alloc] initWithRootViewController:vc5];
    [vc5 release];
    UITabBarItem *otherItem1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:5];
    vc5.tabBarItem = otherItem1;
    [otherItem1 release];
    
    // 将视图控制器添加至数组中
    NSArray *viewControllers = @[homeNav, msgNav, searchNav, setNav, otherNav];
    [homeNav release];
    [msgNav release];
    [searchNav release];
    [setNav release];
    
    [self setViewControllers:viewControllers animated:YES];
}

- (void)loadCustomTabBarView
{
    /*
     * 层次：背景（最下）、选中图片（中间）、按钮（最上）
     */
    
    // 初始化自定义TabBar背景
    _tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 431, 320, 49)];
    _tabBarBG.userInteractionEnabled = YES;
    _tabBarBG.image = [UIImage imageNamed:@"tabBar"];
    [self.view addSubview:_tabBarBG];
    
    // 初始化自定义选中背景
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 49.0/2 - 45.0/2, 53, 45)];
    _selectView.image = [UIImage imageNamed:@"select"];
    [_tabBarBG addSubview:_selectView];
    
    // 初始化自定义TabBarItem -> UIButton
    float coordinateX = 0;
    for (int index = 0; index < 5; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = index;
        button.frame = CGRectMake(14+coordinateX, 49.0/2 - 20, 42, 40);
        NSString *imageName = [NSString stringWithFormat:@"%d", index+1];
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [_tabBarBG addSubview:button];
        [button addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
        coordinateX += 62;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadViewControllers];

    [self loadCustomTabBarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_selectView release];
    [_tabBarBG release];
    [super dealloc];
}

- (void)showTabBar
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.34];
    _tabBarBG.frame = CGRectMake(0, 431, 320, 49);
    [UIView commitAnimations];
}

- (void)hiddenTabBar
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35];
    _tabBarBG.frame = CGRectMake(-320, 431, 320, 49);
    [UIView commitAnimations];
}

- (void)changeViewController:(UIButton *)button
{
    self.selectedIndex = button.tag;
    
    [UIView beginAnimations:nil context:NULL];
    _selectView.frame = CGRectMake(10 + button.tag*62, 49.0/2 - 45.0/2, 53, 45);
    [UIView commitAnimations];
}

@end
