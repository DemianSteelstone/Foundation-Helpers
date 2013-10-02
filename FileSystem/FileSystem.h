//
//  FileSystem.h
//  TimeTracker
//
//  Created by Evgeny Rusanov on 26.04.11.
//  Copyright 2011 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FileSystem : NSObject {
    NSString *_documentsFolder;
    NSString *_libraryFolder;
    NSString *_cachesFolder;
}

+(FileSystem*)sharedFileSystem;

-(NSString*)documentsFolder;
-(NSString*)libraryFolder;
-(NSString*)cachesFolder;

-(NSString*)libraryDocsFolder;

-(NSString*)documentsPathForFile:(NSString*)file;
-(NSString*)bundlePathForFile:(NSString*)file;
-(NSString*)libraryDocsPathForFile:(NSString*)file;
-(NSString*)cachesPathForFile:(NSString*)file;

-(NSString*)findFilePath:(NSString*)file;
-(NSString*)findFilePathInWritableLocation:(NSString*)file;

+(NSString*)randomFileName:(NSString*)ext;
+(NSString*)randomFilePathIn:(NSString*)folder extension:(NSString*)ext;

-(BOOL)fileExistInBundle:(NSString*)file;

+(BOOL)setNoBackupAttribute:(NSString*)path;

@end
