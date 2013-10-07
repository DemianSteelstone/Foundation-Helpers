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
    int h,m,s;
};

typedef struct sTHTimeStruct THTimeStruct;

@interface TimeHelper : NSObject

-(id)initWithSeconds:(int)seconds;

-(THTimeStruct)getTimeStruc;
-(NSString*)convertToString_HHmm;

@end