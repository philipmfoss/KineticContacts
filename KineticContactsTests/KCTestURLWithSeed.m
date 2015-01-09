//
//  KCTestURLWithNoResults.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RUApi.h"

@interface KCTestURLWithSeed : XCTestCase
{
    RURequest *url;
}

@end

@implementation KCTestURLWithSeed

- (void)setUp
{
    [super setUp];
    url = [[RURequest alloc]initWithSeed:@"xyz" withGender:RUGENDER_FEMALE withResult:32];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testEquality
{
    XCTAssert([[url getUrl] isEqual:[NSURL URLWithString:@"http://api.randomuser.me/0.4.1/?results=32&gender=female&seed=xyz"]], @"");
}

@end
