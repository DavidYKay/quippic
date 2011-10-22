//
//  NSString+URLEscaping.h
//  Quippic
//
//  Created by David Kay on 10/22/11.
//  Copyright 2011 Gargoyle Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSString_URLEscaping)

-(NSString*)stringByEscapingValidURLCharacters;

@end
