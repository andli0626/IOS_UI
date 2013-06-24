//
//  AppDelegate.m
//  1.SimpleNavigationDemo
//
//  Created by 周泉 on 13-2-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "NavigationViewController.h"

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
    
    // Navigation rootVC -> rootViewController
    RootViewController *rootViewController = [[RootViewController alloc] init];
//    NSLog(@"rootViewController nav 1: %p", rootViewController.navigationController);
    
    /*
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    // iOS 5.0
    if ([navigation.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        
        [navigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation"] forBarMetrics:UIBarMetricsDefault];
    }
    */
    NavigationViewController *navigation = [[NavigationViewController alloc] initWithRootViewController:rootViewController];
//    NSLog(@"rootViewController nav 2: %p", rootViewController.navigationController);
    self.window.rootViewController = navigation;
    [rootViewController release];
    [navigation release];
    
    return YES;
}

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
