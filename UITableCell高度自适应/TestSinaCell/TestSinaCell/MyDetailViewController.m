//
//  MyDetailViewController.m
//  TestSinaWeibo
//
//  Created by ibokan on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyDetailViewController.h"
#import "MyCell.h"
#import "MYSinaWeiboScrollView.h"
@implementation MyDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        dataArr = [[NSMutableArray alloc] init];
        for (int i = 0; i<5; i++) {
            NSString * str = [[NSString alloc] initWithFormat:@"kldsjioadsfoadshfasdfaldshfas"];
            [dataArr addObject:str];
            [str release];
        }

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
    
    
//    MySinaScrollCell * test = [[MySinaScrollCell alloc] initWithFrame:CGRectMake(0, 100, 0, 0)];
//    test.backgroundColor = [UIColor clearColor];
////    [test.textLabel.text setValue:@"adsjfaskljfalskjfaisjadsjfadsjfadsjfadsjfadsjdf" forKey:@"textLabel.text"];
//    test.contentText = @"adsjfaskljfa";
//    [self.view addSubview:test];
//    [test release];
    
    MYSinaWeiboScrollView * test = [[MYSinaWeiboScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-20-49-44)];
    test.datasource = self;
    [self.view addSubview:test];
    [test release];
    
        
}
- (NSInteger)numberOfRows{
//    NSLog(@"numberOfRows = %d", [dataArr count]);
    return  [dataArr count];
}
- (MyCell *)cellForRowAtIndexPath:(NSInteger)indexPath{
    MyCell * cell = [[MyCell alloc] initWithFrame:CGRectZero];
    cell.contentStr = [dataArr objectAtIndex:indexPath];
    return cell;
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
