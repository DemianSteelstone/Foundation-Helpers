//
//  NSDictionary+Helpers.m
//  photomovie
//
//  Created by Evgeny Rusanov on 15.12.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "NSDictionary+Helpers.h"

@implementation NSDictionary (Helpers)

-(NSString*)convertToString:(NSString*)delimeter
{
    return [self convertToString:delimeter keysArray:self.allKeys];
}

-(NSString*)convertToString:(NSString*)delimeter keysArray:(NSArray*)keys
{
    return [self convertToString:delimeter keysArray:keys quotes:YES];
}

-(NSString*)convertToString:(NSString*)delimeter keysArray:(NSArray*)keys quotes:(BOOL)quotes
{
    NSString *q = @"";
    if (quotes)
        q = @"\"";
    
    NSMutableString *result = [NSMutableString string];
    for (NSString *key in keys)
    {
        if (result.length)
            [result appendString:delimeter];
        [result appendFormat:@"%@=%@%@%@",key,q,[self valueForKey:key],q];
    }
    return result;
}

@end
