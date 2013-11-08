//
//  ViewController.m
//  UIImageViewDemo
//
//  Created by 李林 on 13-4-9.
//  Copyright (c) 2013年 李林. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myImageView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getServerImgFromNet];
	
}



- (void)dealloc {
    [myImageView release];
    [super dealloc];
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

//    NSLog(@"返回值=%@",result);
    
    if([result rangeOfString:@"fileContent"].location !=NSNotFound){
        NSString *attachStr =[StringUtil getXMLFormatedAttribute:result :@"WebDB_Meeting_Attach"];
        NSString *fileContent =[StringUtil getXMLFormatedAttribute:attachStr :@"fileContent"];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"<![CDATA[" withString:@""];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"]]></fileContent>" withString:@""];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"]]>" withString:@""];
        
        NSData *data = [GTMBase64 decodeString:fileContent];
      
        UIImage *image2=[UIImage imageWithData:data];
        [myImageView setImage:image2];
        
        
        
    }
    
}

// 请求失败
-(void)requestUserFailed:(UserWebServiceHelper*)helper
{
    NSLog(@"请求失败!");
}

//////////////////////////根据图片的ID去获取图片END/////////////////////////////
@end
