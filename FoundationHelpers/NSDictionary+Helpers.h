//
//  NSDictionary+Helpers.h
//  photomovie
//
//  Created by Evgeny Rusanov on 15.12.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helpers)

-(NSString*)convertToString:(NSString*)delimeter keysArray:(NSArray*)keys quotes:(BOOL)quotes;
-(NSString*)convertToString:(NSString*)delimeter keysArray:(NSArray*)keys;
-(NSString*)convertToString:(NSString*)delimeter;

@end
