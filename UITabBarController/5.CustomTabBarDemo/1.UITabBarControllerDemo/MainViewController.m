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
        self.tabBar.hidden = YES;//隐藏系统的TabBar
    }
    return self;
}

- (void)loadViewControllers
{
       
    // 首页
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:vc1];
    [vc1 release];
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    vc1.tabBarItem = homeItem;
    [homeItem release];
    
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
    
    [self setViewControllers:viewControllers animated:YES];//重新定义UITabBar的View
}

- (void)loadCustomTabBarView
{
      
    // 初始化自定义TabBar背景
    _tabBarBG_ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 480-49, 320, 49)];
    _tabBarBG_ImageView.userInteractionEnabled = YES;
    _tabBarBG_ImageView.image = [UIImage imageNamed:@"tabBar"];
    [self.view addSubview:_tabBarBG_ImageView];
    
    // 初始化自定义选中背景
    _selectView_ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 49.0/2 - 45.0/2, 53, 45)];
    _selectView_ImageView.image = [UIImage imageNamed:@"select"];
    [_tabBarBG_ImageView addSubview:_selectView_ImageView];
    
    // 初始化自定义TabBarItem -> UIButton
    float coordinateX = 0;
    
    for (int index = 0; index < 5; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = index;
        button.frame = CGRectMake(14+coordinateX, 49.0/2 - 20, 42, 40);
        NSString *imageName = [NSString stringWithFormat:@"%d", index+1];
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [_tabBarBG_ImageView addSubview:button];
        [button addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
        coordinateX += 62;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadViewControllers];//初始化View

    [self loadCustomTabBarView];//初始化底部bar
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [_selectView_ImageView release];
    [_tabBarBG_ImageView release];
    [super dealloc];
}

- (void)showTabBar
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.34];
    _tabBarBG_ImageView.frame = CGRectMake(0, 431, 320, 49);
    [UIView commitAnimations];
}

- (void)hiddenTabBar
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35];
    _tabBarBG_ImageView.frame = CGRectMake(-320, 431, 320, 49);
    [UIView commitAnimations];
}

- (void)changeViewController:(UIButton *)button
{
    self.selectedIndex = button.tag;
    
    [UIView beginAnimations:nil context:NULL];
    _selectView_ImageView.frame = CGRectMake(10 + button.tag*62, 49.0/2 - 45.0/2, 53, 45);
    [UIView commitAnimations];
}

@end
