//
//  operatePlist.h
//  transfer
//
//  Created by LEIBI on 11/18/15.
//  Copyright © 2015 LEIBI. All rights reserved.
//

#import <Cordova/CDV.h>

@interface operatePlist : CDVPlugin
{
    
}

- (void)copyPlist:(CDVInvokedUrlCommand *)command;

- (void)writePlist:(CDVInvokedUrlCommand *)command;
- (BOOL)write:(NSString *)fileName withInfo:(NSDictionary *)info;
- (BOOL)write:(NSString *)fileName withArray:(NSArray *)info;

- (void)readPlist:(CDVInvokedUrlCommand *)command;
- (NSDictionary *)read:(NSString *)fileName;

@end
