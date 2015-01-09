
//  Created by Philip Foss on 2015-01-08.

#import <Foundation/Foundation.h>
#import "RUApiDelegate.h"
#import "RUJsonParser.h"
#import "RUResult.h"
#import "RUUser.h"
#import "RUName.h"
#import "RULocation.h"
#import "RUPicture.h"
#import "RURequest.h"
#import "RUResponse.h"

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

@end
