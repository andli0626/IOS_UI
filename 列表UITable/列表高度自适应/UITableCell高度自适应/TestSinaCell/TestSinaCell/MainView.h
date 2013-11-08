//
//  RootViewController.h
//  TestSinaCell
//
//  Created by ibokan on 12-6-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * dataArr;
}

@end
