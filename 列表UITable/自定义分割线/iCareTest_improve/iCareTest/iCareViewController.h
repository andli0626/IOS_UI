//
//  iCareViewController.h
//  iCareTest
//
//  Created by Kevin Lee on 13-5-16.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define HeightFOR5 548
#define HeightFOR4 460
#define Width 320
#define BackgroundColor [UIColor colorWithRed:240/255.0 green:239/255.0 blue:237/255.0 alpha:1.0]

@protocol tableViewDelegate <NSObject>

-(void)backTableView:(NSIndexPath *)indexpath;

@end

@interface iCareViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,tableViewDelegate>
{
    UITableView     *mtableview;
    NSIndexPath     *chosenIndexPath;
    BOOL            expand;
    CGRect          chosenCellFrame;
    CGFloat         appHeight;
}
@property (nonatomic,retain) NSIndexPath    *chosenIndexPath;
@property (nonatomic,assign) CGRect         chosenCellFrame;
@end
