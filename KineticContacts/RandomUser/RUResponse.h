
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>
#import "RUApiDelegate.h"

// Encapsulates RandomUser Web service.
// See https://randomuser.me
// Only version 0.4.1 of the RadomUser API is supported.
// Not all fields are available. See RUUser class for the fields that are available.
@interface RUResponse : NSObject

// Handles the response from the RandomUser service.
// Only application/json MIME type is supported.
// If successful passes back an array of RUResult objects through the delegate.
// Passes back an error through the delegate on either a system error or a web-service error.
// See RUApiDelegate
- (void)handleResponse:(NSString*)mimeType withData:(NSData*)data withError:(NSError*)error withDelegate:(id<RUApiDelegate>)delegate;

@end
