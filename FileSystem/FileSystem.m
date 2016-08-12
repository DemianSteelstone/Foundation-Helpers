//
//  FileSystem.m
//  TimeTracker
//
//  Created by Evgeny Rusanov on 26.04.11.
//  Copyright 2011 Macsoftex. All rights reserved.
//

#import "FileSystem.h"

@import Darwin.C.time;
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/xattr.h>

@implementation FileSystem
{
    NSString *_documentsFolder;
    NSString *_libraryFolder;
    NSString *_cachesFolder;
}

+ (FileSystem *)sharedFileSystem
{
    static dispatch_once_t pred;
    static FileSystem *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[FileSystem alloc] init];
    });
    return shared;
}

-(NSString*)systemFolderOfType:(NSSearchPathDirectory)type
{
    NSArray *searchPaths =
    NSSearchPathForDirectoriesInDomains
    (type, NSUserDomainMask, YES);
    return searchPaths[0];
}

-(NSString*)documentsFolder
{
    if (!_documentsFolder)
        _documentsFolder = [self systemFolderOfType:NSDocumentDirectory];
    
    return _documentsFolder;
}

-(NSString*)libraryFolder
{
    if (!_libraryFolder)
        _libraryFolder = [self systemFolderOfType:NSLibraryDirectory];
    
    return _libraryFolder;
}

-(NSString*)cachesFolder
{
    if (!_cachesFolder)
        _cachesFolder = [self systemFolderOfType:NSCachesDirectory];
    
    return _cachesFolder;
}

-(NSString*)documentsPathForFile:(NSString *)file
{
    return [NSString stringWithFormat:@"%@/%@",
            [self documentsFolder], file];
}

-(NSString*)libraryDocsFolder
{
    NSString *path = [NSString stringWithFormat:@"%@/%@.private_documents",
                      [self libraryFolder],
                      [[NSBundle mainBundle] bundleIdentifier]];
    [[NSFileManager defaultManager] createDirectoryAtPath:path
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:NULL];
    return path;
}

-(NSString*)cachesPathForFile:(NSString *)file
{
    return [NSString stringWithFormat:@"%@/%@",
            [self cachesFolder], file];
}

-(NSString*)libraryDocsPathForFile:(NSString*)file
{
    return [NSString stringWithFormat:@"%@/%@",
            [self libraryDocsFolder],
            file];
}


-(NSString*)bundlePathForFile:(NSString*)file
{
    NSString *boundlePath = [[NSBundle mainBundle] resourcePath];
    
    return [NSString stringWithFormat:@"%@/%@",boundlePath,file];
}

-(BOOL)fileExistInBundle:(NSString*)file
{
    NSString *filePath = [self bundlePathForFile:file];
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

-(NSString*)findFilePath:(NSString*)file
{
    NSString *filePath = [self bundlePathForFile:file];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
        return filePath;
    filePath = [self documentsPathForFile:file];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
        return filePath;
    filePath = [self libraryDocsPathForFile:file];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
        return filePath;
    filePath = [self cachesPathForFile:file];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
        return filePath;
    return nil;
}

-(NSString*)findFilePathInWritableLocation:(NSString*)file
{
    NSString *filePath = [self documentsPathForFile:file];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
        return filePath;
    filePath = [self libraryDocsPathForFile:file];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
        return filePath;
    filePath = [self cachesPathForFile:file];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
        return filePath;
    return nil;
}

+(NSString*)randomFileName:(NSString*)ext
{
    return [NSString stringWithFormat:@"%ld_%d.%@",time(NULL),rand(),ext];
}

+(NSString*)randomFilePathIn:(NSString*)folder extension:(NSString*)ext
{
    return [NSString stringWithFormat:@"%@/%@",folder,[FileSystem randomFileName:ext]];
}

+(BOOL)setNoBackupAttribute:(NSString*)path
{
    NSURL *URL = [NSURL fileURLWithPath:path];
    
    const char* filePath = [[URL path] fileSystemRepresentation];
    
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}

@end
