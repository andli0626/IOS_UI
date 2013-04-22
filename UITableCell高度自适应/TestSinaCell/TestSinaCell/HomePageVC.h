//
//  HomePageVC.h
//  testCell
//
//  Created by ibokan on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYSinaWeiboScrollView.h"
@interface HomePageVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * dataArr;
}
@end
