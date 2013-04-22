//
//  MyDetailViewController.h
//  TestSinaWeibo
//
//  Created by ibokan on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYSinaWeiboScrollView.h"
@interface MyDetailViewController : UIViewController<MYSinaWeiboScrollViewdatasource>
{
    NSMutableArray * dataArr;
}
@end
