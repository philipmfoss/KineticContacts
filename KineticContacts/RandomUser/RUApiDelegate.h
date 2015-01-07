
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>

// Delegate protocol for the RUApi class.
// The RUApi object container should implement this interface.
@protocol RUApiDelegate <NSObject>

// Passes back an array of RUResult objects on a successful call to RandomUser web-service.
// See https://randomuser.me
// Only version 0.4.1 of the RadomUser API is supported.
// Not all fields are available. See RUUser class for the fields that are available.
- (void)didGetRandomUserResults:(NSArray*)results;

// Passes back an error through the delegate on either a system error.
- (void)failedGetRandomUserResponseWithError:(NSError*)error;

// Passes back an error string through the delegate on either a system error.
// See https://randomuser.me documentation concerning errors.
- (void)failedGetRandomUserResponseWithApiError:(NSString*)error;

@end
