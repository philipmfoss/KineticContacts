//
//  testRandomUserUrlWithResults.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RUApi.h"

@interface KCTestURLWith100Results : XCTestCase
{
    RURequest *url;
}

@end

@implementation KCTestURLWith100Results

- (void)setUp
{
    [super setUp];
    url = [[RURequest alloc]initWithResults:100];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testEquality
{
    XCTAssert([[url getUrl] isEqual:[NSURL URLWithString:@"http://api.randomuser.me/0.4.1/?results=100"]], @"");
}

@end
