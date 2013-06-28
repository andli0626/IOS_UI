//
//  ViewController.m
//  AsynImage
//
//  Created by administrator on 13-3-5.
//  Copyright (c) 2013年 enuola. All rights reserved.
//

#import "TestView.h"
#import "AsynTableViewCell.h"
#import "AsynImageView.h"

@interface TestView ()

@end

@implementation TestView
@synthesize myImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getServerImgFromNet];
    
    //绑定tableView的数据源
    dataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < 3; i++ )
    {
        [dataArray addObject:@"测试图片"];
    }
    
    myTableView.backgroundColor = [UIColor clearColor];
//    /初始化
//    UIImageView  *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 120, 120)];
//    
//    //需要设置图片 UIImage
//    
//    第一种：[imageView setImage:[UIImage imageNamed:@"1.jpeg"]];
//    
//    //第二种：
//    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpeg"];
//    UIImage *images=[UIImage imageWithContentsOfFile:filePath];
//    //[imageView setImage:images];
//    
//    //第三种：
//    NSData *data=[NSData dataWithContentsOfFile:filePath];
//    UIImage *image2=[UIImage imageWithData:data];
//    [imageView setImage:image2];
    myImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];

    
}

- (void)dealloc {
    [myTableView release];
    [dataArray release];
    
    [myImageView release];
    [super dealloc];
}

#pragma mark - UITableView DataSoruce And Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    AsynTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[AsynTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.asynImgView.imageURL = @"c82b7546-74e0-4547-a86a-ad15d8b82271";
    cell.lblTitle.text = [NSString stringWithFormat:@"图片%d", indexPath.row];
    
    return cell;
    
}

//////////////////////////根据图片的ID去获取图片START/////////////////////////////
-(void)getServerImgFromNet
{
    WebServiceHelper * service = [[[WebServiceHelper alloc]initWebService:@"GetFile_Zxft"] autorelease];
    [service addParameterForString:@"MeetingGuid" value:@"c82b7546-74e0-4547-a86a-ad15d8b82271"];
    service.delegate = self;
    [service startASynchronous];
}

// 请求成功
-(void)requestFinished:(UserWebServiceHelper*)helper
{
    
    NSString *result = [helper getSimpleResult];
    NSLog(@"图片返回值=%@",@"主页面图片请求");
    if([result rangeOfString:@"fileContent"].location !=NSNotFound){
        NSString *fileContent =[StringUtil getXMLFormatedAttribute:result :@"fileContent"];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"<![CDATA[" withString:@""];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"]]></fileContent>" withString:@""];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"=]]>" withString:@""];
        //        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"]]></fileContent>" withString:@""];
//        NSLog(@"图片返回值=%@",fileContent);
        
        NSData *data = [GTMBase64 decodeString:fileContent];
        
        self.myImageView = [UIImage imageWithData:data];
        
        
               
    }

}

// 请求失败
-(void)requestUserFailed:(UserWebServiceHelper*)helper
{
    NSLog(@"请求失败!");
}

//////////////////////////根据图片的ID去获取图片END/////////////////////////////


- (void)viewDidUnload {
    [self setMyImageView:nil];
    [super viewDidUnload];
}
@end
