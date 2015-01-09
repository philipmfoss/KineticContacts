//
//  RUApi.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-08.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "RUApi.h"
#import "RUResponse.h"
#import "RURequest.h"

@implementation RUApi

- (void)getRandomUserWithDelegate:(id<RUApiDelegate>)delegate
{
    [self getRandomUsers:1 withDelegate:delegate];
}

- (void)getRandomUsers:(NSInteger)count withDelegate:(id<RUApiDelegate>)delegate
{
    NSURL *url = [[[RURequest alloc]initWithResults:count] getUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         @autoreleasepool {
             [[[RUResponse alloc]init] handleResponse:response.MIMEType withData:data withError:error withDelegate:delegate];
         }
     }];
}


@end
