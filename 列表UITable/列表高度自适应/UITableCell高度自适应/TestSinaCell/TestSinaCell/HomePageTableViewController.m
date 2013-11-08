//
//  HomePageTableViewController.m
//  TestSinaWeibo
//
//  Created by ibokan on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageTableViewController.h"

//@interface HomePageTableViewController(PriveteMethods)
//-(void)refreshData;
//@end

@implementation HomePageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
-(void)dealloc{
    [dataArr release],dataArr = nil;
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    engine = [[WBEngine alloc] initWithAppKey:kWBSDKDemoAppKey appSecret:kWBSDKDemoAppSecret];
//    engine.delegate = self;
    dataArr = [[NSMutableArray alloc] initWithObjects:@"ldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfa",@"ldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfaldsjioadsfoadshfasdfaldshfa", nil];
    for (int i = 0; i<5; i++) {
        NSString * str = [[NSString alloc] initWithFormat:@"kldsjioadsfoadshfasdfaldshfas"];
        [dataArr addObject:str];
        [str release];
    }


    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
//    UIImage * backgroudImage = [[UIImage imageNamed:@"background.png"] stretchableImageWithLeftCapWidth:100 topCapHeight:100];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
//    NSLog(@"+++++++++++++++++++self.view%@ = %@",self.view,self.view.subviews);
//    [self refreshData];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


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
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}
/*
#pragma mark - load微博数据
-(void)refreshData{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:engine.accessToken forKey:@"access_token"];
    [engine loadRequestWithMethodName:@"statuses/home_timeline.json" 
                           httpMethod:@"GET" params:dic 
                         postDataType:kWBRequestPostDataTypeNone 
                     httpHeaderFields:nil];
}

#pragma mark - WBEngineDelegate Methods

-(void)engine:(WBEngine *)engine requestDidSucceedWithResult:(id)result{
    
    NSLog(@"%@,%@,requestDidSucceedWithResult = %@",self,self.view.subviews,result);
    
    if ([result isKindOfClass:[NSDictionary class]]) //模糊判断，MemberOfClass为精确判断
    {
        NSDictionary * dic = (NSDictionary *)result;
        [dataArr addObjectsFromArray:[dic objectForKey:@"statuses"]];
        [self.tableView reloadData];
    }
    
}

-(void)engine:(WBEngine *)engine requestDidFailWithError:(NSError *)error{
    NSLog(@"requestDidFailWithError = %@",error);
}
 */
@end
