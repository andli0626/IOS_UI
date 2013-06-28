#import <UIKit/UIKit.h>

@interface MyWebViewController : UIViewController <UIWebViewDelegate> {
	IBOutlet UITextField * myTextField;
	IBOutlet UIWebView * myWebView;
        NSMutableString *finalstr;
}

@property(nonatomic, retain) UIWebView * myWebView;
@property(nonatomic, retain) UITextField * myTextField;


- (IBAction) changeLocation: (id) sender;

@end

