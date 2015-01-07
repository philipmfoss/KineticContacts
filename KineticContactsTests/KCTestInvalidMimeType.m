//
//  KCTestInvalidMimeType.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RUApi.h"

@interface KCTestInvalidMimeType : XCTestCase <RUApiDelegate>
{
    NSArray *_results;
    NSString *_apierror;
    NSError *_error;
}

@end

@implementation KCTestInvalidMimeType

- (void)setUp
{
    [super setUp];
    NSString *json = @"{\"results\":[{\"user\":{\"gender\":\"female\",\"name\":{\"title\":\"mrs\",\"first\":\"anne\",\"last\":\"schmidt\"},\"location\":{\"street\":\"1826 photinia ave\",\"city\":\"belen\",\"state\":\"rhode island\",\"zip\":\"15846\"},\"email\":\"anne.schmidt12@example.com\",\"username\":\"bigbear938\",\"password\":\"cecile\",\"salt\":\"XcUxZ3FW\",\"md5\":\"a3e8c6699c70c406ff2498bfdc2d95d3\",\"sha1\":\"64a9aa265cd15aca6f161af3cb7f009cbd4f5a2f\",\"sha256\":\"b0778bd3779e543a4bdcdf6d79ee873ebd787e0db4e81ada7d9a3a877c6ae6a6\",\"registered\":\"1078900584\",\"dob\":\"378482052\",\"phone\":\"(188)-982-5151\",\"cell\":\"(713)-300-5337\",\"SSN\":\"235-84-9823\",\"picture\":{\"large\":\"http://api.randomuser.me/portraits/women/31.jpg\",\"medium\":\"http://api.randomuser.me/portraits/med/women/31.jpg\",\"thumbnail\":\"http://api.randomuser.me/portraits/thumb/women/31.jpg\"},\"version\":\"0.4.1\"},\"seed\":\"philipmfoss\"},{\"user\":{\"gender\":\"male\",\"name\":{\"title\":\"mr\",\"first\":\"mitchell\",\"last\":\"hanson\"},\"location\":{\"street\":\"2254 hogan st\",\"city\":\"roseburg\",\"state\":\"wisconsin\",\"zip\":\"49412\"},\"email\":\"mitchell.hanson90@example.com\",\"username\":\"silverbird379\",\"password\":\"angelica\",\"salt\":\"ux5XtpWl\",\"md5\":\"488600258117d6a293bd23f9c298a909\",\"sha1\":\"3b1306e572da467aedece038f138ae24b1ae1ac4\",\"sha256\":\"0b35c55acae353fc977d28d3605d0385a077b68fc434fd5ad68ed22cf5b5f4de\",\"registered\":\"1279391522\",\"dob\":\"59516518\",\"phone\":\"(454)-707-4391\",\"cell\":\"(340)-859-7809\",\"SSN\":\"685-91-9640\",\"picture\":{\"large\":\"http://api.randomuser.me/portraits/men/88.jpg\",\"medium\":\"http://api.randomuser.me/portraits/med/men/88.jpg\",\"thumbnail\":\"http://api.randomuser.me/portraits/thumb/men/88.jpg\"},\"version\":\"0.4.1\"},\"seed\":\"6c2987a4d1694062\"}]}";
    
    RUApi *api = [[RUApi alloc]init];
    [api handleResponse:@"application/text" withData:[json dataUsingEncoding:NSUTF8StringEncoding] withError:nil withDelegate:self];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testResultsNil
{
    XCTAssertNil(_results, @"");
}

- (void)testErrorNil
{
    XCTAssertNil(_error, @"");
}

- (void)testApiErrorNil
{
    XCTAssertNil(_apierror, @"");
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
