
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>

@protocol RUApiDelegate <NSObject>

- (void)didGetRandomUserResults:(NSArray*)results;
- (void)failedGetRandomUserResponseWithError:(NSError*)error;
- (void)failedGetRandomUserResponseWithApiError:(NSString*)error;

@end
