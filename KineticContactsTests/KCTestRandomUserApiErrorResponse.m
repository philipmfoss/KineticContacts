//
//  KCTestRandomUserApiErrorResponse.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RUApi.h"

@interface KCTestRandomUserApiErrorResponse : XCTestCase <RUApiDelegate>
{
    NSArray *_results;
    NSString *_apierror;
    NSError *_error;
}

@end

@implementation KCTestRandomUserApiErrorResponse

- (void)setUp
{
    [super setUp];
    NSString *json = @"{\"error\":\"Uh oh, something has gone wrong. Please tweet us @randomapi about the issue. Thank you.\"}";    RUApi *api = [[RUApi alloc]init];
    [api handleResponse:@"application/json" withData:[json dataUsingEncoding:NSUTF8StringEncoding] withError:nil withDelegate:self];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testErrorNil
{
    XCTAssertNil(_error,@"");
}

- (void)testResultsNil
{
    XCTAssertNil(_results,@"");
}


- (void)testErrorText
{
    XCTAssert([_apierror isEqualToString:@"Uh oh, something has gone wrong. Please tweet us @randomapi about the issue. Thank you."],@"");
}


- (void)didGetRandomUserResults:(NSArray*)results
{
    _results = results;
}

- (void)failedGetRandomUserResponseWithError:(NSError*)error
{
    _error = error;
}

- (void)failedGetRandomUserResponseWithApiError:(NSString*)error
{
    _apierror  =error;
}


@end
