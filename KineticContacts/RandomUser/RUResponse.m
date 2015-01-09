
//  Created by Philip Foss on 2015-01-05.


#import "RUResponse.h"
#import "RURequest.h"
#import "RUJsonParser.h"

@implementation RUResponse

- (void)handleResponse:(NSString*)mimeType withData:(NSData*)data withError:(NSError*)error withDelegate:(id<RUApiDelegate>)delegate
{
    if (data && [data length] > 0 && error == nil) {
        if( [mimeType isEqualToString:@"application/json"]) {
            NSError *parsererror = nil;
            RUJsonParser *parser = [[RUJsonParser alloc]initWithData:data andError:&parsererror];
            if( parsererror ) {
                [delegate failedGetRandomUserResponseWithError:parsererror];
            }
            else {
                if( !parser.error ) {
                    [delegate didGetRandomUserResults:parser.results];
                }
                else {
                    [delegate failedGetRandomUserResponseWithApiError:parser.error];
                }
            }
        }
    }
    else if (error != nil) {
        [delegate failedGetRandomUserResponseWithError:error];
    }
}

@end
