//
//  NSString+URLEscaping.m
//  Quippic
//
//  Created by David Kay on 10/22/11.
//  Copyright 2011 Gargoyle Software. All rights reserved.
//

#import "NSString+URLEscaping.h"

@implementation NSString (NSString_URLEscaping)


-(NSString*)stringByEscapingValidURLCharacters
{
    NSString *escaped = [self stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@"!" withString:@"%21"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@"'" withString:@"%27"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@"(" withString:@"%28"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@")" withString:@"%29"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@"*" withString:@"%2A"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@"/" withString:@"%2F"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@"@" withString:@"%40"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@":" withString:@"%3A"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@";" withString:@"%3B"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"];
    escaped = [escaped stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    
    return escaped;
    
}

@end