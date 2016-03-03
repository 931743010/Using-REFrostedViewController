//
//  NLSecurity.h
//  NLSecurity
//
//  Created by su on 14-1-14.
//  Copyright (c) 2014年 suzw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NLAlgorithm.h"

@interface NLSecurity : NSObject
+ (NSString*)encryptWithAlgorithm:(id<NLEncryptAlgorithm>)algorithm;
+ (NSString*)decryptWithAlgorithm:(id<NLDecryptAlgorithm>)algorithm;
//// helper methods
+ (NSString*)getPemEntityFromPemFileConent:(NSString*)content;
@end
