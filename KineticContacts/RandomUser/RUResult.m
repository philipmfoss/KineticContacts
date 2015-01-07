//
//  RandomUserResult.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "RUResult.h"

@interface RUResult()
@property (nonatomic,readwrite) NSString *seed;
@property (nonatomic,readwrite) RUUser *user;
@end

@implementation RUResult

- (id)initWithUser:(RUUser*)user forSeed:(NSString*)seed
{
    if( self = [super init]) {
        self.seed = seed;
        self.user = user;
    }
    return self;
}

@end
