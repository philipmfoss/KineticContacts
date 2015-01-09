
//  Created by Philip Foss on 2015-01-05.


#import "RUApi.h"
#import "RUURL.h"

@implementation RUApi

- (void)getRandomUserWithDelegate:(id<RUApiDelegate>)delegate
{
    [self getRandomUsers:1 withDelegate:delegate];
}

- (void)getRandomUsers:(NSInteger)count withDelegate:(id<RUApiDelegate>)delegate
{
    NSURL *url = [[[RUURL alloc]initWithResults:count] getUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        [self handleResponse:response.MIMEType withData:data withError:error withDelegate:delegate];
    }];
}

- (void)handleResponse:(NSString*)mimeType withData:(NSData*)data withError:(NSError*)error withDelegate:(id<RUApiDelegate>)delegate
{
    @autoreleasepool {
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
}

@end
