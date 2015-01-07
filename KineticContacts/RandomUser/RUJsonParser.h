//
//  RUJsonParser.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RUApiDelegate.h"

@interface RUJsonParser : NSObject

+ (const NSString* __strong)getSupportedVersion;

- (id)initWithData:(NSData*)data andError:(NSError**)error;

@property (nonatomic,readonly) NSArray *results;
@property (nonatomic,readonly) NSString *error;


@end
