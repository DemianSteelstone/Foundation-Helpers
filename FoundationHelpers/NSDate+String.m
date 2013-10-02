//
//  NSDate+String.m
//  photomovie
//
//  Created by Evgeny Rusanov on 01.08.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "NSDate+String.h"

@implementation NSDate (String)

-(NSString*)convertToString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    return [formatter stringFromDate:self];
}

-(NSString*)convertToStringWithFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

@end
