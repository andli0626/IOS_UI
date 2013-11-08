//
//  ThirdView.m
//  NavigationDemo
//
//  Created by 李林 on 13-3-31.
//  Copyright (c) 2013年 李林. All rights reserved.
//

#import "ThirdView.h"

@interface ThirdView ()

@end

@implementation ThirdView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView{
    UIView *baseView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    baseView.backgroundColor = [UIColor grayColor];//灰色
    self.view = baseView;
    [baseView release];
    
    self.title = @"第三个页面";
    
        
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"pop" forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(90, 200, 140, 40)];
    [backButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushButton setTitle:@"topView" forState:UIControlStateNormal];
    [pushButton setFrame:CGRectMake(90, 249, 140, 40)];
    [pushButton addTarget:self action:@selector(backTopView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    
    
}



#pragma mark -Pop Action
-(void)popView{
    //返回上层
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - push thirdview
-(void)backTopView{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
