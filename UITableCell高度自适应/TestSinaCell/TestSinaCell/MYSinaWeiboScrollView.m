//
//  MYSinaWeiboScrollView.m
//  TestSinaWeibo
//
//  Created by ibokan on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MYSinaWeiboScrollView.h"

@implementation MYSinaWeiboScrollView
@synthesize datasource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
//    NSLog(@"initwithframe");
    if (self) {
        
        NSInteger cellCount = [self.datasource numberOfRows];
//        NSLog(@"if = %d",cellCount);
        int contentHeight = 0;
        for (int i = 0; i<cellCount; i++) {
            MyCell * cell = [self.datasource cellForRowAtIndexPath:i];
            
//            NSLog(@"iffor");
            
            if (i>0) {
                MyCell * formerCell = [self.subviews objectAtIndex:i-1];
                CGRect formerCellFrame = formerCell.frame;
                CGRect cellFrame = cell.frame;
//                NSLog(@"cellFrame = %@",cellFrame);
                cellFrame.origin.y = formerCellFrame.origin.y + formerCellFrame.size.height;
                cell.frame = cellFrame;
            }
            [self addSubview:cell];
            [cell release];
            
            contentHeight += cell.frame.size.height;
        }
        
        self.contentSize = CGSizeMake(0, contentHeight);
        
    }
    return self;
}
-(void)dealloc{
   
    [super dealloc];
}

@end
