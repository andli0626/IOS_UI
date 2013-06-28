//
//  AppDelegate.m
//  NavigationDemo
//
//  Created by 李林 on 13-3-31.
//  Copyright (c) 2013年 李林. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //初始化页面
    RootView *rootView = [[RootView alloc]init];
    
    //初始化导航控制器，并指定RootView作为根视图
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:rootView];
    
    self.window.rootViewController = navigation;
    
    [rootView release];
    [navigation release];
    
    return YES;
}



@end
