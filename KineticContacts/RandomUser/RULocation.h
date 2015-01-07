//
//  RULocation.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RULocation : NSObject

- (id)initWithStreet:(NSString*)street withCity:(NSString*)city withState:(NSString*)state withZip:(NSString*)zip;

@property (nonatomic,readonly) NSString *street;
@property (nonatomic,readonly) NSString *city;
@property (nonatomic,readonly) NSString *state;
@property (nonatomic,readonly) NSString *zip;

@end

