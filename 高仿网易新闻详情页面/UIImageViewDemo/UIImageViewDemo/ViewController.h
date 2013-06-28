//
//  ViewController.h
//  UIImageViewDemo
//
//  Created by 李林 on 13-4-9.
//  Copyright (c) 2013年 李林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserWebServiceHelper.h"
#import "StringUtil.h"
#import "GDataXMLNode.h"
#import "GTMBase64.h"
#import "WebServiceHelper.h"
@interface ViewController : UIViewController<UserWebServiceDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *myImageView;

@end
