//
//  TimeHelper.m
//  VKSearch
//
//  Created by Evgeny Rusanov on 04.07.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TimeHelper.h"

@implementation TimeHelper
{
    NSUInteger _seconds;
}

-(id)initWithSeconds:(NSUInteger)seconds
{
    if (self = [super init])
    {
        _seconds = seconds;
    }
    return self;
}

-(THTimeStruct)getTimeStruc
{
    THTimeStruct time;
    time.h = _seconds / (60*60);
    
    NSInteger hh = time.h * 60 *60;
    NSInteger fullMinutes = _seconds - hh;
    time.m = fullMinutes / 60;
    time.s = fullMinutes % 60;
    
    return time;
}

-(NSString*)convertToString_HHmm
{
    THTimeStruct time = [self getTimeStruc];
    
    return [NSString stringWithFormat:@"%.2ld:%.2ld",(long)time.h,(long)time.m];
}

-(NSString*)convertToString_HH_MM_SS
{
    THTimeStruct time = [self getTimeStruc];
    
    if (time.h > 0)
        return [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld",(long)time.h,(long)time.m,(long)time.s];
    return [NSString stringWithFormat:@"%.2ld:%.2ld",(long)time.m,(long)time.s];
}




@end
