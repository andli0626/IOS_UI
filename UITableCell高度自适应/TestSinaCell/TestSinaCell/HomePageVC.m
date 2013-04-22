//
//  HomePageVC.m
//  testCell
//
//  Created by ibokan on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageVC.h"

@implementation HomePageVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    UIView * aView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    aView.backgroundColor = [UIColor orangeColor];
    self.view = aView;
    [aView release];
    
    UITableView * myTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
    myTabelView.dataSource = self;
    myTabelView.delegate = self;
    [self.view addSubview:myTabelView];
    
    
    dataArr = [[NSMutableArray alloc] initWithObjects:@"ldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfa",@"ldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfa", nil];
    for (int i = 0; i<5; i++) {
        NSString * str = [[NSString alloc] initWithFormat:@"kldsjioadsfoadshfasdfaldshfas"];
        [dataArr addObject:str];
        [str release];
    }
    
    
    myTabelView.separatorColor = [UIColor clearColor];

    myTabelView.backgroundColor = [UIColor clearColor];
    //    UIImage * backgroudImage = [[UIImage imageNamed:@"background.png"] stretchableImageWithLeftCapWidth:100 topCapHeight:100];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
//    NSLog(@"+++++++++++++++++++self.view%@ = %@",self.view,self.view.subviews);
    //    [self refreshData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        
        
    }
    
    UIView * sinacellview = [cell.contentView.subviews lastObject];
    [sinacellview removeFromSuperview];
    MyCell * sinacell = [[MyCell alloc] initWithFrame:CGRectZero];
    
    [cell.contentView addSubview:sinacell];
    
    sinacell.contentStr = [dataArr objectAtIndex:indexPath.row];
//    NSLog(@"cell.subviews = %@",cell.contentView.subviews);
    cell.frame = sinacell.frame;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    [sinacell release];
    
    //    NSDictionary * detail = [dataArr objectAtIndex:indexPath.row];//每条微博是一个字典
    //    cell.textLabel.text = [[detail objectForKey:@"user"] objectForKey:@"screen_name"];//用户昵称
    //    cell.detailTextLabel.text = [detail objectForKey:@"text"];//微博内容
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"height = %d",indexPath.row);
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height+10;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
