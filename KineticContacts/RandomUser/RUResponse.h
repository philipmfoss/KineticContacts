
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>
#import "RUApiDelegate.h"
#import "RUJsonParser.h"
#import "RUResult.h"
#import "RUUser.h"
#import "RUName.h"
#import "RULocation.h"
#import "RUPicture.h"

// Encapsulates RandomUser Web service.
// See https://randomuser.me
// Only version 0.4.1 of the RadomUser API is supported.
// Not all fields are available. See RUUser class for the fields that are available.
@interface RUApi : NSObject

// Rerieves a single user with a random seed from RandomUser web service.
// If successful passes back an array with a single RUResult object through the delegate.
// Passes back an error through the delegate on either a system error or a web-service error.
// See RUApiDelegate
- (void)getRandomUserWithDelegate:(id<RUApiDelegate>)delegate;

// Rerieves the specified number of users with a random seed from RandomUser web service.
// If successful passes back an array of RUResult objects through the delegate.
// Passes back an error through the delegate on either a system error or a web-service error.
// See RUApiDelegate
- (void)getRandomUsers:(NSInteger)count withDelegate:(id<RUApiDelegate>)delegate;

// Handles the response from the RandomUser service.
// Only application/json MIME type is supported.
// If successful passes back an array of RUResult objects through the delegate.
// Passes back an error through the delegate on either a system error or a web-service error.
// See RUApiDelegate
- (void)handleResponse:(NSString*)mimeType withData:(NSData*)data withError:(NSError*)error withDelegate:(id<RUApiDelegate>)delegate;

@end
