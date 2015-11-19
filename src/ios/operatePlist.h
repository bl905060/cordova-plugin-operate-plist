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

- (void)writePlist:(CDVInvokedUrlCommand *)command;
- (void)readPlist:(CDVInvokedUrlCommand *)command;

@end
