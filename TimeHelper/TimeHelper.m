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
    int _seconds;
}

-(id)initWithSeconds:(int)seconds
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
    
    int hh = time.h * 60 *60;
    int fullMinutes = _seconds - hh;
    time.m = fullMinutes / 60;
    time.s = fullMinutes % 60;
    
    return time;
}

-(NSString*)convertToString_HHmm
{
    THTimeStruct time = [self getTimeStruc];
    
    return [NSString stringWithFormat:@"%.02d:%.02d",time.h,time.m];
}

-(NSString*)convertToString_HH_MM_SS
{
    THTimeStruct time = [self getTimeStruc];
    
    if (time.h > 0)
        return [NSString stringWithFormat:@"%.02d:%.02d:%.02d",time.h,time.m,time.s];
    return [NSString stringWithFormat:@"%.02d:%.02d",time.m,time.s];
}




@end
