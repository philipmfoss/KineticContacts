//
//  RandomUserLocation.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "RULocation.h"

@interface RULocation()

@property (nonatomic,readwrite) NSString *street;
@property (nonatomic,readwrite) NSString *city;
@property (nonatomic,readwrite) NSString *state;
@property (nonatomic,readwrite) NSString *zip;

@end

@implementation RULocation

- (id)initWithStreet:(NSString*)street withCity:(NSString*)city withState:(NSString*)state withZip:(NSString*)zip
{
    if( self = [super init]) {
        self.street = street;
        self.city = city;
        self.state = state;
        self.zip = zip;
    }
    return self;
}

@end
