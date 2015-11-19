//
//  operatePlist.h
//  transfer
//
//  Created by LEIBI on 11/18/15.
//  Copyright © 2015 LEIBI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface operatePlist : NSObject

+ (void)writePListWithFileName:(NSString *)fileName withData:(NSDictionary *)info;
+ (NSDictionary *)readPListWithFileName:(NSString *)fileName;

@end
