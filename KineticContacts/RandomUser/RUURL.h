//
//  RUURL.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RUGender.h"

@interface RUURL : NSObject

- (id)initWithResults:(NSInteger)result;
- (id)initWithSeed:(NSString*)seed withGender:(RUGender)gender withResult:(NSInteger)result;
- (NSURL*)getUrl;

@property (nonatomic,readonly) NSInteger result;
@property (nonatomic,readonly) NSString *seed;
@property (nonatomic,readonly) RUGender gender;

@end
