//
//  operatePlist.m
//  transfer
//
//  Created by LEIBI on 11/18/15.
//  Copyright © 2015 LEIBI. All rights reserved.
//

#import "operatePlist.h"

@implementation operatePlist

+ (NSDictionary *)readPListWithFileName:(NSString *)fileName {
    NSDictionary *info;
    NSString *folderName = [[NSString alloc] init];
    NSFileManager *file = [NSFileManager defaultManager];
    NSString *errorStr = [[NSString alloc] init];
    
    NSString *filePath = [self GetPathByFolderName:folderName withFileName:fileName];
    if (![file fileExistsAtPath:filePath]) {
        errorStr = @"file is not exist!";
    } else {
        info = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    return info;
}

+ (void)writePListWithFileName:(NSString *)fileName withData:(NSDictionary *)info {
    NSLog(@"begin to write Plist!");
    NSString *folderName = [[NSString alloc] init];
    NSFileManager *file =[NSFileManager defaultManager];
    
    if ([info valueForKey:@"username"]) {
        //folderName = [NSString stringWithFormat:@"/users/%@", [info valueForKey:@"username"]];
    }
    
    NSString *filePath = [self GetPathByFolderName:folderName withFileName:fileName];
    if (![file fileExistsAtPath:filePath]) {
        [file createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    [info writeToFile:filePath atomically:NO];
}


+ (NSString *)GetPathByFolderName:(NSString *)_folderName withFileName:(NSString *)_fileName {
    NSLog(@"begin to generate file path!");
    
    NSError *error;
    NSFileManager *filePath = [NSFileManager defaultManager];
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    directory = [directory stringByAppendingString: _folderName];
    
    if (![filePath fileExistsAtPath:directory]) {
        [filePath createDirectoryAtPath:directory
            withIntermediateDirectories:YES
                             attributes:nil
                                  error:&error];
    }
    
    NSString *fileDirectory = [[[directory stringByAppendingPathComponent:_fileName]
                                stringByAppendingPathExtension:@"plist"]
                               stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",fileDirectory);
    return fileDirectory;
}

@end
