//
//  SZFileManager.h
//  SZKit
//
//  Created by 张杰华 on 2018/9/18.
//  Copyright © 2018年 张杰华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SZFileManager : NSFileManager

+ (NSString *)cacheDirectoryPath;

+ (NSString *)directoryPathWithFileName:(NSString *)fileName;

+ (NSString *)diretoryPathWithDirName:(NSString *)dirName;

@end
