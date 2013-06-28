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
@synthesize mWebView;

-(IBAction)clickButton1:(id)sender{
    NSLog(@"12232323");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getServerImgFromNet];
    
    NSString * mycss =@"<style>p{margin:0px;padding:0px;};#news_outline {font-family:System;color: #808080; font-size:6px;text-align:left;}.ParagraphIndent img{width:100%;max-width:100%;display:block;}.ParagraphIndent,p{-webkit-box-sizing:border-box;box-sizing:border-box; width:100%; padding:0 10px; letter-spacing:0.1px;color:#121212;text-indent:2em;font-size:18px;line-height:150%; overflow: hidden;word-wrap:break-word; word-break: bre-all;height:auto;zoom:1;text-align:justify;text-justify:inter-ideograph;padding-left:2px;font-family:System;}#news_title {font-weight:bold;text-align:left;-webkit-box-sizing:border-box;box-sizing:border-box; width:100%;letter-spacing:0.1px;color:#121212;font-size:20px;line-height:180%; overflow: hidden;word-wrap:break-word; word-break: bre-all;height:auto;zoom:1;text-align:justify;text-justify:inter-ideograph;font-family:System;padding-right:6px};</style>";
    
    NSString *title = @"周小川:大力推动资本市场发展";
    NSString *titlehtml = [NSString stringWithFormat:@"<div id=\"news_title\" >%@</div>",title];
    NSString *time = @"网易财经 06-28 10:02";
    NSString *timehtml = [NSString stringWithFormat:@"<div id=\"news_outline\" >%@</div>",time];
    NSString *content = @"中国人民银行行长周小川今日在2013年陆家嘴论坛上表示,今年来上海国际金融中心建设取得了显著的成绩,首先是大力推动资本市场的发展.资本市场是国际金融中心最核心的内容,也是最具地区效应的内容,它能够发挥引领和带动上海国际金融中心建设的核心作用.";
    NSString *contenthtml = [NSString stringWithFormat:@"<div id=\"ParagraphIndent\" >%@</div>",content];
    
    NSString *html = [NSString stringWithFormat:@"%@%@%@%@",mycss,titlehtml,timehtml,contenthtml];
    [mWebView loadHTMLString:html baseURL:nil];
    NSLog(@"%@",html);
    
}



- (void)dealloc {
    [myImageView release];
    [mWebView release];
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
