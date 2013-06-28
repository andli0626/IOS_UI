//
//  AppDelegate.m
//  TabBarDemo
//
//  Created by 李林 on 13-3-25.
//  Copyright (c) 2013年 李林. All rights reserved.
//

#import "AppDelegate.h"
#include "FirstView.h"
#include "SecoundView.h"

@implementation AppDelegate
@synthesize tabbar;

- (void)dealloc
{
    [_window release];
    [tabbar release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.tabbar =[[UITabBarController alloc]init];
    
    //设置根视图
    self.window.rootViewController = self.tabbar;
    
    //初始化子页面
    FirstView *firstview = [[[FirstView alloc]initWithNibName:@"FirstView" bundle:nil]autorelease];
    SecoundView *secoundview = [[[SecoundView alloc]initWithNibName:@"SecoundView" bundle:nil]autorelease];
    //添加到tabbar
    self.tabbar.viewControllers = @[firstview,secoundview];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
