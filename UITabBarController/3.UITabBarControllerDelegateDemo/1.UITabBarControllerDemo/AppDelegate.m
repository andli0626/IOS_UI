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
    /*
    NSLog(@"vc1 barButtonItem : %p", vc1.navigationItem.leftBarButtonItem);
    NSLog(@"vc1 tabBarItem : %p", vc1.tabBarItem);
     */
    
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
//    UITabBarItem *searchItem = [[UITabBarItem alloc] initWithTitle:@"搜索" image:[UIImage imageNamed:@""] tag:3];
//    vc2.tabBarItem = searchItem;
//    [searchItem release];
    
    // 将视图控制器添加至数组中
    NSArray *viewControllers = @[vc1, vc2, vc3, vc4];
    [vc1 release];
    [vc2 release];
    [vc3 release];
    [vc4 release];
    
    // 创建UITabBarController实例
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    // tabBarController.viewControllers = viewControllers;
    tabBarController.delegate = self; // 设置代理
    [tabBarController setViewControllers:viewControllers animated:YES];
    
//    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:tabBarController];
//    [tabBarController release];
    
    self.window.rootViewController = tabBarController;
    [tabBarController release];
    
    return YES;
}

#pragma mark - TabBarController Delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"shouldSelectViewController");
    return YES; // flag
} // 视图将要切换时调用， viewController为将要显示的控制器

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"didSelectViewController : %@", viewController);
} // 视图已经切换后调用， viewController 是已经显示的控制器

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
