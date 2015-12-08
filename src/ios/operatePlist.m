//
//  operatePlist.m
//  transfer
//
//  Created by LEIBI on 11/18/15.
//  Copyright © 2015 LEIBI. All rights reserved.
//

#import "operatePlist.h"

@implementation operatePlist

- (void)writePlist:(CDVInvokedUrlCommand *)command {
    NSLog(@"begin to write Plist!");
    
    CDVPluginResult *pluginResult;
    NSString *callbackId = [command callbackId];
    NSString *fileName = [command argumentAtIndex:0];
    NSDictionary *info = [command argumentAtIndex:1];
    
    if ([self write:fileName withInfo:info]) {
        NSLog(@"write Plist succeed!");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
    }
    else {
        NSLog(@"write Plist error!");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
    }
}

- (BOOL)write:(NSString *)fileName withInfo:(NSDictionary *)info {
    
    NSString *folderName = [[NSString alloc] init];
    NSFileManager *file =[NSFileManager defaultManager];
    
    if ([info valueForKey:@"username"]) {
        //folderName = [NSString stringWithFormat:@"/users/%@", [info valueForKey:@"username"]];
    }
    
    NSString *filePath = [self GetPathByFolderName:folderName withFileName:fileName];
    if (![file fileExistsAtPath:filePath]) {
        [file createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    NSMutableDictionary *currentInfo = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    NSArray *allKeys = [info allKeys];
    for (int i = 0; i < [allKeys count]; i++) {
        [currentInfo setObject:[info objectForKey:[allKeys objectAtIndex:i]]
                        forKey:[allKeys objectAtIndex:i]];
    }
    if ([currentInfo writeToFile:filePath atomically:NO]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (void)readPlist:(CDVInvokedUrlCommand *)command {
    NSLog(@"begin to read Plist!");
    
    CDVPluginResult *pluginRestul;
    NSString *callbackId = [command callbackId];
    NSString *fileName = [command argumentAtIndex:0];
    
    NSDictionary *info = [[NSDictionary alloc] initWithDictionary:[self read:fileName]];
    
    if ([info objectForKey:@"errorStr"]) {
        NSLog(@"read plist is failure!");
        pluginRestul = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                         messageAsString:[info objectForKey:@"errorStr"]];
    } else {
        NSLog(@"read plist is OK!");
        pluginRestul = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
    }
    
    [self.commandDelegate sendPluginResult:pluginRestul callbackId:callbackId];
}

- (NSDictionary *)read:(NSString *)fileName{
    NSDictionary *currentInfo;
    NSMutableDictionary *errorInfo;
    NSString *folderName = [[NSString alloc] init];
    NSFileManager *file = [NSFileManager defaultManager];
    NSString *errorStr = [[NSString alloc] init];
    
    NSString *filePath = [self GetPathByFolderName:folderName withFileName:fileName];
    if (![file fileExistsAtPath:filePath]) {
        errorStr = @"file is not exist!";
        [errorInfo setObject:errorStr forKey:@"errorStr"];
    }
    else {
        currentInfo = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    
    if (errorStr.length == 0) {
        return currentInfo;
    }
    else {
        return errorInfo;
    }
}

- (NSString *)GetPathByFolderName:(NSString *)_folderName withFileName:(NSString *)_fileName {
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
