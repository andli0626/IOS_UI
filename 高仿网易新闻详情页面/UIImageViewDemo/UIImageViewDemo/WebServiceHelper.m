//
//  WebServiceHelper.m
//  Love7Ke
//
//  Created by mac on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebServiceHelper.h"
#import "GDataXMLNode.h"
@implementation WebServiceHelper
@synthesize funName;
@synthesize funpars;
@synthesize delegate;
@synthesize error=_error;
@synthesize isRequesting;
@synthesize responseData;
#pragma mark 静态方法
+(NSString *)getWSDLURL
{
    return [NSString stringWithFormat:@"%@%@",my_web_address,my_web_service];
}

+(NSString*)getUploadURL
{
    return [NSString stringWithFormat:@"%@%@/%@",my_web_address,my_web_service,@"upload"];
}
//返回Soap Body
+(NSString *)getSoapBody:(NSString *)funcationName parameter:(NSString *)content
{
    if(content == nil)
    {
        content = @"";
    }
    return [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body>"
            "<%@ xmlns=\"%@\">"
            "%@"
            "</%@>"
            "</soap:Body></soap:Envelope>",funcationName,my_web_namespace,content,funcationName];
}
//返回SoapBody URL Request 信息
+(NSMutableURLRequest *)getRequest:(NSString *)funcationName parameter:(NSString *)pars
{
    NSString* message = [self getSoapBody:funcationName parameter:pars];
    NSString* mesLenth = [NSString stringWithFormat:@"%d",message.length];
    NSString* funurl = [NSString stringWithFormat:@"%@%@",my_web_namespace,funcationName];
    NSURL* url = [NSURL URLWithString:[self getWSDLURL]];
    
//    NSLog(@"url is :%@",url);
//    NSLog(@"SOAPAction is %@: ",funurl);
//    NSLog(@"SoapBoay:%@",message);
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:funurl forHTTPHeaderField:@"SOAPAction"];
    [request addValue:mesLenth forHTTPHeaderField:@"Content-Length"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[message dataUsingEncoding:NSUTF8StringEncoding]];
        
    return request;
}

#pragma mark 对象初始化 和释放
-(id)initWebService:(NSString *)funcationName
{
    self = [super init];
    if(self)
    {
        isRequesting = NO;
        self.responseData = [NSMutableData dataWithCapacity:64];
        self.funName = funcationName;
        self.funpars = [NSMutableString stringWithString:@""];
    }
    return self;
}
-(void)addParameterForString:(NSString *)name value:(NSString *)value
{
    [funpars appendFormat:@"<%@>%@</%@>",name,value,name];
}
-(void)addParameterForInt:(NSString *)name value:(NSInteger)value
{
    [funpars appendFormat:@"<%@>%d</%@>",name,value,name];
}
-(void)addParameterForFloat:(NSString *)name value:(CGFloat)value
{
    [funpars appendFormat:@"<%@>%.2f</%@>",name,value,name];    
}
-(void)addParameterForBool:(NSString *)name value:(BOOL)value
{
    [funpars appendFormat:@"<%@>%@</%@>",name,value?@"true":@"false",name];        
}


#pragma mark 上传文件
-(void)uploadWithPath:(NSString *)filepath
{
    UIImage* image = [UIImage imageWithContentsOfFile:filepath];
   [self uploadWithImage:image];
}
-(void)uploadWithImage:(UIImage *)image
{
    NSMutableURLRequest* request= [UploadNSRequest uploading:image message:@"hello ljh"];
    isRequesting = YES;
    [NSURLConnection connectionWithRequest:request delegate:self];
}
-(void)responseFail
{
    if([delegate respondsToSelector:@selector(requestFailed:)])
    {
        [delegate requestFailed:self];
    }
}
-(void)responseFinished
{
    if([delegate respondsToSelector:@selector(requestFinished:)])
    {
        [delegate requestFinished:self];
    }
}
-(void)startSynchronous
{
    if(isRequesting)
    {
        return;
    }
    NSMutableURLRequest* request = [WebServiceHelper getRequest:funName parameter:funpars];
    isRequesting = YES;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&_error];
    if(data == nil)
    {
        [self responseFail];
    }
    [responseData appendData:data];
    [self responseFinished];
}
-(void)startASynchronous
{
    if(isRequesting)
    {
        return;
    }
    NSMutableURLRequest* request = [WebServiceHelper getRequest:funName parameter:funpars];
    isRequesting = YES;
    [NSURLConnection connectionWithRequest:request delegate:self];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{       
    [responseData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self responseFinished];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.error = error;
    [self responseFail];
}
-(NSArray *)getArrayResult
{
    GDataXMLElement* element = [self getResultElement];
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i<element.children.count; i++) {
        GDataXMLElement* subChild = [element.children objectAtIndex:i];
        [array addObject:subChild.stringValue];
    }
    return array;
}
-(NSString *)getSimpleResult
{
    GDataXMLElement* element = [self getResultElement];
    NSString* result =  element.stringValue;
    return result;
}
-(GDataXMLElement*) getResultElement
{
    NSData* data = [self responseData];
    if(!data)
    {
        return nil;
    }
    
//    NSLog(@"data result :%@",[[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] autorelease]);
    GDataXMLDocument* _GDataParse = [[[GDataXMLDocument alloc]initWithData:data  options:0 error:&_error] autorelease];
    if(_error)
    {
        NSLog(@"ASIHTTPREQUEST DATA PARSE ERROR : %@",_error.debugDescription);
    }
    GDataXMLElement* element =[[[[[_GDataParse.rootElement.children objectAtIndex:0] children]objectAtIndex:0] children] objectAtIndex:0];
    return element;
}
#pragma mark dealloc
-(void)dealloc
{
    [super dealloc];
//    [funName release];
//    [funpars release];
//    [responseData release];
//    [_error release];
//    [delegate release];
    NSLog(@"web service released");
}
@end



//#define NOTIFY_AND_LEAVE(X) {[self cleanup:X]; return;}
#define DATA(X)	[X dataUsingEncoding:NSUTF8StringEncoding]

// Posting constants
#define IMAGE_CONTENT @"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\nContent-Type: image/jpeg\r\n\r\n"
#define STRING_CONTENT @"Content-Disposition: form-data; name=\"%@\"\r\n\r\n"
#define MULTIPART @"multipart/form-data; boundary=------------0x0x0x0x0x0x0x0x"
#define BOUNDARY @"------------0x0x0x0x0x0x0x0x"

@implementation UploadNSRequest
+(NSData*)generateFormDataFromPostParam:(NSDictionary*)dictParam
{
    NSMutableData* formData = [NSMutableData data];
	
    NSArray* keys = [dictParam allKeys];
    
    int index = 0;
    for (; index<[keys count]; ++index) 
    {
        NSString *boundaryString = [NSString stringWithFormat:@"--%@\r\n", BOUNDARY];
        [formData appendData:DATA(boundaryString)];
		
        id value = [dictParam valueForKey:[keys objectAtIndex:index]];
		if ([value isKindOfClass:[NSData class]]) 
		{
			// 处理图片数据
			NSString *formstring = [NSString stringWithFormat:IMAGE_CONTENT, [keys objectAtIndex:index]];
			[formData appendData:DATA(formstring)];
			[formData appendData:value];
		}
		else 
		{
			// 处理注释文本
			NSString *formstring = [NSString stringWithFormat:STRING_CONTENT, [keys objectAtIndex:index]];
			[formData appendData:DATA(formstring)];
			[formData appendData:DATA(value)];
		}
		
		NSString *formstring = @"\r\n";
        [formData appendData:DATA(formstring)];
    }
	
	NSString *formstring =[NSString stringWithFormat:@"--%@--\r\n", BOUNDARY];
    [formData appendData:DATA(formstring)];
    
    return formData;
}
+(NSMutableURLRequest *)uploading:(UIImage *)image message:(NSString *)mes
{
    if (!image)
	{
        NSLog(@"Please set image before uploading.");
        return nil;
    }    
    
	NSMutableDictionary* postParam = [[[NSMutableDictionary alloc] init] autorelease];
    
    // 设置 message 字段内容为“注释信息”
	[postParam setObject:mes forKey:@"message"];
    

//    UIImagePNGRepresentation(image); PNG 格式
    // 设置 media 字段内容为“照片数据” 
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75f);
	[postParam setObject:imageData forKey:@"photo"];
	
	NSData *postData = [self generateFormDataFromPostParam:postParam];
    NSString *postLength = [NSString stringWithFormat:@"%d", postData.length];
    
    NSString *urlString = [WebServiceHelper getUploadURL]; 
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    if (!urlRequest)
    {
        NSLog(@"Error creating the URL Request");
        return nil;
    }
    [urlRequest addValue:MULTIPART forHTTPHeaderField:@"Content-Type"];
    [urlRequest addValue:postLength forHTTPHeaderField:@"Content-Length"];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:postData];
    
	//[urlRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    return urlRequest;

}
@end
