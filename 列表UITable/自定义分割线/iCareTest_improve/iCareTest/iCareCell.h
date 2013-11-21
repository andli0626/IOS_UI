//
//  iCareCell.h
//  iCareTest
//
//  Created by Kevin Lee on 13-5-16.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCareCellScrollView.h"

@interface iCareCell : UITableViewCell
{
    CGFloat         appHeight;
}
@property(nonatomic,strong)UILabel *label_title;
@property(nonatomic,strong)UILabel *label_source;
@property(nonatomic,strong)UILabel *label_time;
@property(nonatomic,strong)UIImageView *imgView_line;

@property(nonatomic,strong) UIView *cellView;
@property(nonatomic,strong)UIButton *btn_back;
@property(nonatomic,strong) NSIndexPath * subIndex;
@property(nonatomic,weak) id<tableViewDelegate> tabledelegate;

@property(nonatomic,strong)iCareCellScrollView *myScrollview;

-(void)changeContent:(BOOL)expand;

@end
