#import "MyWebViewController.h"

@implementation MyWebViewController

@synthesize myWebView;
@synthesize myTextField;


- (void) viewDidLoad {
    myWebView.delegate = self;
    myWebView.scrollView.bounces = NO;//禁止拖动空白
    finalstr =[[NSMutableString alloc]initWithString:@""];  //初始化拼装字符串
    
//    myWebView = [[[UIWebView alloc]initWithFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height - kTabBarHeight) ] autorelease];
//    
//    moblieWebView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    myWebView.dataDetectorTypes = UIDataDetectorTypeNone; //去掉数字下划线
    
    NSString *resourcePath = [ [NSBundle mainBundle] resourcePath];
    
    NSURL *baseURL = [NSURL fileURLWithPath:resourcePath];
    
//    NSString *HeadPath = [resourcePath stringByAppendingPathComponent:@"Head.html"];
//    
//    NSString *startString=[[[NSString alloc] initWithContentsOfFile:HeadPath  encoding:NSUTF8StringEncoding error:nil] autorelease];
//    
//    //html head
//    
//    [finalstr appendString:startString];
    
    //加载动态html数据
    [finalstr appendString:@"<body>\n"];
    [finalstr appendString:@"<body>\n"];
    
    [finalstr appendString:@"<div id=\"caption\">\n"];
    
    //加载标题
    
    [finalstr appendString:@"<div id=\"title\">\n"];
    
    [finalstr appendString:@"<h1>"];
    
    [finalstr appendFormat:@"标题"];  //标题
    
    [finalstr appendString:@"</h1>\n"];
    
    [finalstr appendString:@"</div>\n"];
    
    //加载日期
    
    [finalstr appendString:@"<div id=\"date\">\n"];
    
    [finalstr appendString:@"<h2>"];
    
    [finalstr appendFormat:@"2012-10-09"];  //日期
    
    [finalstr appendString:@"</h2>\n"];
    
    [finalstr appendString:@" </div>\n"];
    
    [finalstr appendString:@"<div id=\"text\">\n"];
    
    //显示的图片
    
    [finalstr appendString:@"<a href = \"javascript:void(0)\" onclick = \"document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'\"><div id=\"pic\"><img class=\"img-wrapper\" src=\"http://www.huangpuqu.sh.cn//shhpadmin/UploadFile/admin/image/DSC_0069.JPG\"></div>\n"];
    
    //显示的图片上的加号
    
    [finalstr appendFormat:@"<div id=\"pic\"><img class=\"plus\" src=\"http://www.huangpuqu.sh.cn//shhpadmin/UploadFile/admin/image/DSC_0069.JPG\" style=\"position:absolute; \"/></div></a> "];
    
    //点击放大后 图片上的叉号
    
    [finalstr appendString:@"<div id=\"light\" class=\"white_content\">"];
    
    [finalstr appendString:@"<a href = \"javascript:void(0)\" onclick = \"document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'\"><img id=\"button\" class=\"funtion_button\" src=\"http://www.huangpuqu.sh.cn//shhpadmin/UploadFile/admin/image/DSC_0069.JPG\" style=\"display:block;\"/><img id=\"EnlargePhoto\" src=\"http://www.huangpuqu.sh.cn//shhpadmin/UploadFile/admin/image/DSC_0069.JPG\" onload=\"javascript:DrawImage(this)\"/ ></a></div>"];
    
    [finalstr appendString:@"<div id=\"fade\" class=\"black_overlay\"></div>"];
    
    [finalstr appendFormat:@"<p>简介 简介 简介</p>"];
    
    [finalstr appendFormat:@"<p>这里是内容</p>"];
    
    [finalstr appendFormat:@"<p>这里是时间</p>"];
    
    [finalstr appendFormat:@"<p>这里是作者</p>"];
    
    //html end
    
    [finalstr appendFormat:@"</div>\n</div>\n</body>\n</html>\n"];
    
    [myWebView loadHTMLString:finalstr baseURL:nil];
    
    myWebView.scalesPageToFit = YES;
    
//    [view addSubview:moblieWebView];
}

- (void)dealloc {
	myWebView.delegate = nil;
	[myTextField release];
	[myWebView release];
	[super dealloc];
}

- (IBAction) changeLocation: (id) sender {
	[myTextField resignFirstResponder];
	NSURL * url = [NSURL URLWithString: myTextField.text];
	NSURLRequest * request = [NSURLRequest requestWithURL:url];
	[myWebView loadRequest:request];
}

#pragma mark WebView 委托
#pragma mark --
- (void)webViewDidFinishLoad: (UIWebView *) webView {
	NSLog(@"%@", [webView stringByEvaluatingJavaScriptFromString:
				  @"document.body.innerHTML"]);
}

@end
