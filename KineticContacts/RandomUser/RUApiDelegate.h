//
//  RUApiDelegate.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RUApiDelegate <NSObject>

- (void)didGetRandomUserResults:(NSArray*)results;
- (void)failedGetRandomUserResponseWithError:(NSError*)error;
- (void)failedGetRandomUserResponseWithApiError:(NSString*)error;

@end
