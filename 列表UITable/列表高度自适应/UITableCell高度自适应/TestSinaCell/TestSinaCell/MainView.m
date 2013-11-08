//
//  RootViewController.m
//  TestSinaCell
//
//  Created by ibokan on 12-6-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "MyCell.h"
#import "MyCellData.h"

@implementation MainView


-(void)refreshData{
    MyCellData * data1 = [[MyCellData alloc] initWithText:@"有文字有图片短短短短短短短短短短短短短短短短短短短短短短短短短短短短短短"
                                                CellImage:[UIImage imageNamed:@"headImage.png"]];
    MyCellData * data2 = [[MyCellData alloc] initWithText:@"有文字有图片长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长"
                                                CellImage:[UIImage imageNamed:@"headImage.png"]];
    
    MyCellData * data3 = [[MyCellData alloc] initWithText:@"有文字有图片" CellImage:[UIImage imageNamed:@"headImage.png"]];
    
    dataArr = [[NSMutableArray alloc] initWithObjects:data1,data2,data3, nil];
    
    for (int i = 0; i<5; i++) {
        MyCellData * data = [[MyCellData alloc] initWithText:@"有文字无图片" CellImage:nil];
        [dataArr addObject:data];
        [data release];
    }
    
    
    MyCellData * data4 = [[MyCellData alloc] initWithText:nil CellImage:[UIImage imageNamed:@"headImage.png"]];
    [dataArr addObject:data4];
    MyCellData * data5 = [[MyCellData alloc] initWithText:nil CellImage:[UIImage imageNamed:@"headImage.png"]];
    [dataArr addObject:data5];
    
    MyCellData * data6 = [[MyCellData alloc] initWithText:nil CellImage:nil];
    [dataArr addObject:data6];
    
    
    [data1 release];
    [data2 release];
    [data3 release];
    [data4 release];
    [data5 release];
    [data6 release];
}


- (void)loadView
{
    UIView * aView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = aView;
    [aView release];
    
    UITableView * myTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-20)
                                                             style:UITableViewStylePlain];
    myTabelView.dataSource = self;
    myTabelView.delegate = self;
    myTabelView.backgroundColor = [UIColor clearColor];
    myTabelView.separatorColor = [UIColor clearColor];
    [self.view addSubview:myTabelView];
    
    [self refreshData];
    
}


#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];

        

         //无色
//         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
         //蓝色
//         cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
         //灰色
         cell.selectionStyle = UITableViewCellSelectionStyleGray;

    }
    
    for (MyCell * sinacell in cell.contentView.subviews) {
        if ([sinacell isKindOfClass:[MyCell class]]) {
            [sinacell removeFromSuperview];
            break;
        }
    }
    //    UIView * sinacellview = [cell.contentView.subviews lastObject];
    //    [sinacellview removeFromSuperview];
    MyCell * sinacell = [[MyCell alloc] initWithFrame:CGRectZero];
    [cell.contentView addSubview:sinacell];
    MyCellData * data = [dataArr objectAtIndex:indexPath.row];
    sinacell.contentStr = data.text;
    sinacell.thumbnailImage = data.cellImage;
    sinacell.headImage = data.cellImage;
    NSLog(@"+++++++++++++ %d  data.cellImage = %@",indexPath.row,data.cellImage);
    
    cell.frame = sinacell.frame;
    [sinacell release];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height+10;
}


@end
