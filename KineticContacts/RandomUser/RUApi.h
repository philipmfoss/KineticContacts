
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>
#import "RUApiDelegate.h"
#import "RUJsonParser.h"
#import "RUResult.h"
#import "RUUser.h"
#import "RUName.h"
#import "RULocation.h"
#import "RUPicture.h"

@interface RUApi : NSObject

- (void)getRandomUserWithDelegate:(id<RUApiDelegate>)delegate;
- (void)getRandomUsers:(NSInteger)count withDelegate:(id<RUApiDelegate>)delegate;
- (void)handleResponse:(NSString*)mimeType withData:(NSData*)data withError:(NSError*)error withDelegate:(id<RUApiDelegate>)delegate;

@end
