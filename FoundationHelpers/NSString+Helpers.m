//
//  NSString+Helpers.m
//  photomovie
//
//  Created by Evgeny Rusanov on 05.12.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "NSString+Helpers.h"

@implementation NSString (Helpers)

+(NSString*)randomString:(int)length
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
    
    for (int i=0; i<length; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
