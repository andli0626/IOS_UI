//
//  MyWebAppDelegate.h
//  MyWeb
//
//  Created by James Brannan on 6/22/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyWebViewController;

@interface MyWebAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MyWebViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MyWebViewController *viewController;

@end

