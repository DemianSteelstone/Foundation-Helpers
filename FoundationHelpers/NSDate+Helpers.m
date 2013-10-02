//
//  NSDate+Components.m
//  photomovie
//
//  Created by Evgeny Rusanov on 17.08.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "NSDate+Helpers.h"

@implementation NSDate (Components)

-(NSDateComponents*)getComponents:(NSUInteger)mask
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    return [gregorian components:mask fromDate:self];
}

+(NSDate*)nowPlusHours:(NSInteger)hours
{
    NSDate *date = [NSDate date];
    
    NSDateComponents *hourComponent = [[NSDateComponents alloc] init];
    [hourComponent setHour:hours];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    return [calendar dateByAddingComponents:hourComponent toDate:date options:0];
}

@end
