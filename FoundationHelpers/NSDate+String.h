//
//  NSDate+String.h
//  photomovie
//
//  Created by Evgeny Rusanov on 01.08.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (String)

-(NSString*)convertToString;
-(NSString*)convertToStringWithFormat:(NSString*)format;

@end
