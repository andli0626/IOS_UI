//
//  iCareAppDelegate.h
//  iCareTest
//
//  Created by Kevin Lee on 13-5-16.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iCareViewController;

@interface iCareAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) iCareViewController *viewController;

@property (strong, nonatomic) UIImageView *splashView;

@end
