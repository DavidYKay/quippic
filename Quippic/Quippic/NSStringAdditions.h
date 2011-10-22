//
//  NSStringAdditions.h
//  Quippic
//
//  Created by David Kay on 10/22/11.
//  Copyright 2011 Gargoyle Software. All rights reserved.
//


#import <Foundation/NSString.h>

@class NSString;

@interface NSString (NSStringAdditions)

+ (NSString *) base64StringFromData:(NSData *)data length:(int)length;

@end