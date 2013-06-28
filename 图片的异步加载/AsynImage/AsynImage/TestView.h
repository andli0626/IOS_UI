//
//  ViewController.h
//  AsynImage
//
//  Created by administrator on 13-3-5.
//  Copyright (c) 2013年 enuola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserWebServiceHelper.h"
#import "StringUtil.h"
#import "GDataXMLNode.h"
#import "GTMBase64.h"
#import "WebServiceHelper.h"
@interface TestView : UIViewController<UITableViewDataSource, UITableViewDelegate,UserWebServiceDelegate>
{
    IBOutlet UITableView *myTableView;
    
    NSMutableArray *dataArray;   //tableView所绑定的数据数组
}
@property (retain, nonatomic) IBOutlet UIImageView *myImageView;


@end
