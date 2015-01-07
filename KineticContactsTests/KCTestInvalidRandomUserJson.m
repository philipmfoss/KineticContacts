//
//  KCTestInvalidRandomUserJson.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RUApi.h"

@interface KCTestInvalidRandomUserJson : XCTestCase <RUApiDelegate>
{
    NSArray *_results;
    NSString *_apierror;
    NSError *_error;
}

@end

@implementation KCTestInvalidRandomUserJson

- (void)setUp
{
    [super setUp];
    NSString *json = @"kjgwslfkvjgsldkvjgl";
    RUApi *api = [[RUApi alloc]init];
    [api handleResponse:@"application/json" withData:[json dataUsingEncoding:NSUTF8StringEncoding] withError:nil withDelegate:self];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testResultsNil
{
    XCTAssertNil(_results, @"");
}

- (void)testErrorNotNil
{
    XCTAssert(_error, @"");
}

- (void)testApiErrorNil
{
    XCTAssertNil(_apierror, @"");
}


- (void)testError
{
    XCTAssert(_error.code == 3840, @"");
    
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
