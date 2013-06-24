//
//  NavigationViewController.m
//  1.SimpleNavigationDemo
//
//  Created by 周泉 on 13-2-3.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // iOS 5.0
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UINavigationBar (SetBackground)

- (void)drawRect:(CGRect)rect
{
//    NSLog(@"%@", NSStringFromCGRect(rect));
    UIImage *image = [UIImage imageNamed:@"top_navigation_background"];
    [image drawInRect:rect];
} // iOS 5.0之前

@end
