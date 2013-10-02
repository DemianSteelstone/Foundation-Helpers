//
//  NSDate+Components.h
//  photomovie
//
//  Created by Evgeny Rusanov on 17.08.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Components)

-(NSDateComponents*)getComponents:(NSUInteger)mask;
+(NSDate*)nowPlusHours:(NSInteger)hours;

@end
