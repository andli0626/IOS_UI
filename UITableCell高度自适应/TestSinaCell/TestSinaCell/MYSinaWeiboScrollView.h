//
//  MYSinaWeiboScrollView.h
//  TestSinaWeibo
//
//  Created by ibokan on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCell.h"
//@protocol MYSinaWeiboScrollViewdelegate <NSObject>
//
//@end

@protocol MYSinaWeiboScrollViewdatasource <NSObject>

- (NSInteger)numberOfRows;
- (MyCell *)cellForRowAtIndexPath:(NSInteger)indexPath;

@end

@interface MYSinaWeiboScrollView : UIScrollView
@property(nonatomic,assign)id<MYSinaWeiboScrollViewdatasource>datasource;
@end
