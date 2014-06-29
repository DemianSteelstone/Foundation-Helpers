//
//  TimeHelper.h
//  VKSearch
//
//  Created by Evgeny Rusanov on 04.07.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <UIKit/UIKit.h>

struct sTHTimeStruct
{
    NSInteger h,m,s;
};

typedef struct sTHTimeStruct THTimeStruct;

@interface TimeHelper : NSObject

-(id)initWithSeconds:(NSUInteger)seconds;

-(THTimeStruct)getTimeStruc;
-(NSString*)convertToString_HHmm;
-(NSString*)convertToString_HH_MM_SS;

@end
