//
//  KCTestRanomUserNetworkError.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RUApi.h"

@interface KCTestRanomUserNetworkError : XCTestCase <RUApiDelegate>
{
    NSArray *_results;
    NSString *_apierror;
    NSError *_error;
}
@end

@implementation KCTestRanomUserNetworkError

- (void)setUp
{
    [super setUp];
    RUResponse *api = [[RUResponse alloc]init];
    NSError *error = [NSError errorWithDomain:@"api.randomuser.me" code:7658 userInfo:[[NSDictionary alloc]init]];
    [api handleResponse:@"application/text" withData:[@"" dataUsingEncoding:NSUTF8StringEncoding] withError:error withDelegate:self];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testResultsNil
{
    XCTAssertNil(_results, @"");
}

- (void)testErrorNoNil
{
    XCTAssert(_error, @"");
}

- (void)testApiErrorNil
{
    XCTAssertNil(_apierror, @"");
}

- (void)testErrorCode
{
    XCTAssert(_error.code == 7658, @"");
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
