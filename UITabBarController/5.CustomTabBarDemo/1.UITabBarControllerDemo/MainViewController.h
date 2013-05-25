//
//  MainViewController.h
//  1.UITabBarControllerDemo
//
//  Created by 周泉 on 13-2-17.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController
{
@private
    UIImageView *_selectView_ImageView;
    UIImageView *_tabBarBG_ImageView;
}

- (void)showTabBar;

- (void)hiddenTabBar;

@end
