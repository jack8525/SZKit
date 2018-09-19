
//
//  SZFileManager.m
//  SZKit
//
//  Created by 张杰华 on 2018/9/18.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import "SZFileManager.h"

@implementation SZFileManager

+ (NSString *)cacheDirectoryPath
{
    NSArray<NSString *> *dirs = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true);
    if (dirs.count > 0) {
        return dirs[0];
    }
    return @"";
}

+ (NSString *)directoryPathWithFileName:(NSString *)fileName
{
    NSString *cacheDir = [self cacheDirectoryPath];
    NSString *filePath = @"";
    filePath = [cacheDir stringByAppendingString:fileName];
    filePath = [filePath stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
    return filePath;
}

+ (NSString *)diretoryPathWithDirName:(NSString *)dirName
{
    NSString *dirPath = [self directoryPathWithFileName:dirName];
    BOOL isDir;
    if (![[self defaultManager] fileExistsAtPath:dirPath isDirectory:&isDir]) {
        if (isDir) {
            [[self defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:true attributes:nil error:nil];
        }
    }
    return dirPath;
}
@end
