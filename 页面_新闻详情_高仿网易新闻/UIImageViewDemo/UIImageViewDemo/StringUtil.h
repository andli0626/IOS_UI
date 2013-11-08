//
//  StringUtil.h
//  EpointMobileFrame
//
//  Created by 李 亚春 on 12-11-8.
//  Copyright (c) 2012年 epoint. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtil : NSObject


//去掉字符串左右空白
+(NSString *)trim:(NSString *)desString;

//截取一个xml标签之间的属性 
+(NSString *)getXMLFormatedAttribute:(NSString *)bs :(NSString *)xmltag;

//截取一个xml，包含被截取的标签
+(NSString *)getXMLFormatedAttributeIncludeTag:(NSString *)bs :(NSString *)xmltag;

//判断字符串是否包含另一个字符串
+(BOOL)contains:(NSString *)bs :(NSString *)child;


@end
