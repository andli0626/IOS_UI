//
//  AsynImageView.m
//  AsynImage
//
//  Created by administrator on 13-3-5.
//  Copyright (c) 2013年 enuola. All rights reserved.
//

#import "AsynImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AsynImageView

@synthesize imageURL = _imageURL;
@synthesize placeholderImage = _placeholderImage;

@synthesize fileName = _fileName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.layer.borderWidth = 2.0;
        self.backgroundColor = [UIColor grayColor];
        
    }
    return self;
}

//重写placeholderImage的Setter方法
-(void)setPlaceholderImage:(UIImage *)placeholderImage
{
    if(placeholderImage != _placeholderImage)
    {
        [_placeholderImage release];
        
        _placeholderImage = placeholderImage;
        self.image = _placeholderImage;    //指定默认图片
    }
}

//重写imageURL的Setter方法
-(void)setImageURL:(NSString *)imageURL
{
    if(imageURL != _imageURL)
    {
        self.image = _placeholderImage;    //指定默认图片
        [_imageURL release];
        _imageURL = [imageURL retain];
    }
    
    if(self.imageURL)
    {
        //确定图片的缓存地址
        NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *docDir=[path objectAtIndex:0];
        NSString *tmpPath=[docDir stringByAppendingPathComponent:@"AsynImage"];
        
        NSFileManager *fm = [NSFileManager defaultManager];
        if(![fm fileExistsAtPath:tmpPath])
        {
            [fm createDirectoryAtPath:tmpPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        //        NSArray *lineArray = [self.imageURL componentsSeparatedByString:@"/"];
        //        self.fileName = [NSString stringWithFormat:@"%@/%@", tmpPath, [lineArray objectAtIndex:[lineArray count] - 1]];
        self.fileName =imageURL;
        //判断图片是否已经下载过，如果已经下载到本地缓存，则不用重新下载。如果没有，请求网络进行下载。
        NSString *tempFileName =[NSString stringWithFormat:@"%@.jpg",_fileName];
        if(![[NSFileManager defaultManager] fileExistsAtPath:tempFileName])
        {
            //下载图片，保存到本地缓存中
            //            [self loadImage];
            [self getServerImgFromNet];
//            NSLog(@"getImageFromNet");
        }
        else
        {
            //本地缓存中已经存在，直接指定请求的网络图片
            self.image = [UIImage imageWithContentsOfFile:tempFileName];
//            NSLog(@"getImageFromLocal");
        }
    }
}

//////////////////////////根据图片的ID去获取图片START/////////////////////////////
-(void)getServerImgFromNet
{
    WebServiceHelper * service = [[[WebServiceHelper alloc]initWebService:@"GetFile_Zxft"] autorelease];
    [service addParameterForString:@"MeetingGuid" value:self.imageURL];
    service.delegate = self;
    [service startASynchronous];
    
    
}

// 请求成功
-(void)requestFinished:(WebServiceHelper*)helper
{
    
    NSString *result = [helper getSimpleResult];
    
    if([result rangeOfString:@"fileContent"].location !=NSNotFound){
        NSString *fileContent =[StringUtil getXMLFormatedAttribute:result :@"fileContent"];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"<![CDATA[" withString:@""];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"]]></fileContent>" withString:@""];
        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"]]>" withString:@""];
        //        fileContent = [fileContent stringByReplacingOccurrencesOfString:@"]]></fileContent>" withString:@""];
//        NSLog(@"图片返回值=%@",fileContent);
        
        NSData *data = [GTMBase64 decodeString:fileContent];
//        UIImage *image2=[UIImage imageWithData:data];
//
//        [self.image setImage:image2];
        self.image = [UIImage imageWithData:data];
        
        
        
        //图片已经成功下载到本地缓存，指定图片
        NSString *fileName =[NSString stringWithFormat:@"%@.jpg",_fileName];
        NSLog(@"\n图片名称:%@",fileName);
        if([data writeToFile:fileName atomically:YES])
        {
            //            self.image = [UIImage imageWithContentsOfFile:fileName];
            
        }
        
    }
}

// 请求失败
-(void)requestUserFailed:(UserWebServiceHelper*)helper
{
    NSLog(@"请求失败!");
}

//////////////////////////根据图片的ID去获取图片END/////////////////////////////



-(void)dealloc
{
    [_fileName release];
    [loadData release];
    [connection release];
    
    [_placeholderImage release];
    [_imageURL release];
    
    [super dealloc];
}




@end
