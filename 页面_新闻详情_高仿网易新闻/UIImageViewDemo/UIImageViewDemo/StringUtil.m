//
//  StringUtil.m
//  EpointMobileFrame
//
//  Created by 李 亚春 on 12-11-8.
//  Copyright (c) 2012年 epoint. All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil

+(NSString *)trim:(NSString *)desString
{
    return [desString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


+(NSString *)getXMLFormatedAttribute:(NSString *)bs :(NSString *)xmltag
{
    NSString *tagq = [NSString stringWithFormat:@"<%@>",xmltag];
    NSString *tagh = [NSString stringWithFormat:@"</%@>",xmltag];
    NSRange srangeq = [bs rangeOfString:tagq];
    NSRange srangeh = [bs rangeOfString:tagh];
    if(srangeq.length>0&&srangeh.length>0){
        NSInteger loc = srangeq.location+srangeq.length;
        NSInteger len = srangeh.location-srangeq.location-srangeq.length;
        NSRange range = NSMakeRange(loc, len);
        NSString *des = [bs substringWithRange:range];
        return des;
    }
    else
    {
        return @"";
    }
}

+(NSString *)getXMLFormatedAttributeIncludeTag:(NSString *)bs :(NSString *)xmltag
{
    NSString *tagq = [NSString stringWithFormat:@"<%@>",xmltag];
    NSString *tagh = [NSString stringWithFormat:@"</%@>",xmltag];
    NSRange srangeq = [bs rangeOfString:tagq];
    NSRange srangeh = [bs rangeOfString:tagh];
    if(srangeq.length>0&&srangeh.length>0){
        NSInteger loc = srangeq.location+srangeq.length;
        NSInteger len = srangeh.location-srangeq.location-srangeq.length;
        NSRange range = NSMakeRange(loc, len);
        NSString *des = [bs substringWithRange:range];
        return [NSString stringWithFormat:@"<%@>%@</%@>",xmltag,des,xmltag];
    }
    else
    {
        return @"";
    }
}

+(BOOL)contains:(NSString *)bs :(NSString *)child
{
    if([bs rangeOfString:child].location == NSNotFound)
    {
        return NO;
    }
    else{
        return YES;
    }
}

@end
