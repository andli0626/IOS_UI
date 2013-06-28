//
//  AsynCell.h
//  AsynImage
//
//  Created by administrator on 13-3-5.
//  Copyright (c) 2013年 enuola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsynImageView.h"
#import "UserWebServiceHelper.h"
#import "StringUtil.h"
#import "GDataXMLNode.h"
#import "GTMBase64.h"

@interface AsynTableViewCell : UITableViewCell<UserWebServiceDelegate>

@property (nonatomic, retain) AsynImageView *asynImgView;
@property (nonatomic, retain) UILabel *lblTitle;

@end
