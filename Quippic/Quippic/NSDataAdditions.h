//
//  NSDataAdditions.h
//  Quippic
//
//  Created by David Kay on 10/22/11.
//  Copyright 2011 Gargoyle Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (NSDataAdditions)

+ (NSData *) base64DataFromString:(NSString *)string;

@end