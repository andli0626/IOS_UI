//
//  SecoundView.m
//  NavigationDemo
//
//  Created by 李林 on 13-3-31.
//  Copyright (c) 2013年 李林. All rights reserved.
//

#import "SecoundView.h"

@interface SecoundView ()

@end

@implementation SecoundView

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
	// Do any additional setup after loading the view.
}

- (void)loadView{
    UIView *baseView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    baseView.backgroundColor = [UIColor yellowColor];//紫色
    self.view = baseView;
    [baseView release];
    
    self.title = @"第二个页面";
    
    //代码添加一个Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"ishidden" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 150, 140, 40)];
    [button addTarget:self
               action:@selector(hideView)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"pop" forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(90, 200, 140, 40)];
    [backButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [pushButton setFrame:CGRectMake(90, 249, 140, 40)];
    [pushButton addTarget:self action:@selector(pushThirdView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];

    
    
}

#pragma mark - Target Action

-(void)hideView{
    //隐藏导航栏
    if(self.navigationController.toolbarHidden){
        [self.navigationController setToolbarHidden:NO animated:YES];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else{
        [self.navigationController setToolbarHidden:YES animated:YES];
        [self.navigationController setNavigationBarHidden:YES animated:YES];

    }
}

#pragma mark -Pop Action
-(void)popView{
    //返回上层
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - push thirdview
-(void)pushThirdView{
    ThirdView *thirdView = [[ThirdView alloc]init];
    [self.navigationController pushViewController:thirdView animated:YES];
    [thirdView release];
}

@end
