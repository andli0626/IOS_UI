//
//  AppDelegate.m
//  1.UITabBarControllerDemo
//
//  Created by 周泉 on 13-2-16.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "MesssageViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /*
     * 1. 创建若干个子视图控制器（它们是并列的关系）
     *  1.1 创建UITabBarItem实例，赋值给相应的子视图控制器（2种方法）
     * 2. 创建一个数组，将已创建的子视图控制器，添加到数组中
     * 3. 创建UITabBarController实例
     * 4. tabBarController.viewControllers = viewControllers;
     * 5. 添加到window的rootViewController中
     */
    
    // 首页
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    vc1.tabBarItem = homeItem;
    [homeItem release];
    
    
    // 消息页
    MesssageViewController *vc2 = [[MesssageViewController alloc] init];
    UITabBarItem *msgItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
    vc2.tabBarItem = msgItem;
    [msgItem release];
    
    // 搜索页
    SearchViewController *vc3 = [[SearchViewController alloc] init];
    UITabBarItem *searchItem = [[UITabBarItem alloc] initWithTitle:@"搜索" image:[UIImage imageNamed:@"alarm"] tag:3];
    vc3.tabBarItem = searchItem;
    [searchItem release];
    
    // 设置页
    SettingViewController *vc4 = [[SettingViewController alloc] init];
    
    // 将视图控制器添加至数组中
    NSArray *viewControllers = @[vc1, vc2, vc3, vc4];
    [vc1 release];
    [vc2 release];
    [vc3 release];
    [vc4 release];
    
    // 创建UITabBarController实例
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:viewControllers animated:YES];
    
    self.window.rootViewController = tabBarController;
    [tabBarController release];
    
    return YES;
}



@end
