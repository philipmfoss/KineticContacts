//
//  RandomUserName.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "RUName.h"

@interface RUName()
@property (nonatomic,readwrite) NSString *firstName;
@property (nonatomic,readwrite) NSString *title;
@property (nonatomic,readwrite) NSString *lastName;
@end

@implementation RUName

- (id)initWithFirstName:(NSString*)firstName withTitle:(NSString*)title withLastName:(NSString*)lastName
{
    if( self = [super init]) {
        self.firstName = firstName;
        self.title = title;
        self.lastName = lastName;
    }
    return self;
}

@end
