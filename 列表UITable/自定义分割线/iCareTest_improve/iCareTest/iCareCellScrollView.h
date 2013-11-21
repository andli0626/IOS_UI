//
//  iCareCellScrollView.h
//  iCareTest
//
//  Created by Kevin Lee on 13-5-16.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCareViewController.h"

@interface iCareCellScrollView : UIScrollView
{
    CGFloat         appHeight;
}
@property(nonatomic,strong)UILabel *label_title;
@property(nonatomic,strong)UILabel *label_source;
@property(nonatomic,strong)UILabel *label_time;

@property(nonatomic,strong)UILabel *label_content;

@property(nonatomic,strong)UIButton *btn_share;

//@property(nonatomic,strong) NSIndexPath * subIndex;
//@property(nonatomic,weak) id<tableViewDelegate> tabledelegate;

@property(nonatomic,strong) UIScrollView *scrollview_content;

@end
