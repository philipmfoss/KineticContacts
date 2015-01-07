//
//  RandomUserJsonParser.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "RUJsonParser.h"
#import "RUUser.h"
#import "RUResult.h"
#import "RUName.h"
#import "RUPicture.h"
#import "RULocation.h"

const NSString *SUPPORTED_VERSION = @"0.4.1";

@interface RUJsonParser()
@property (nonatomic,readwrite) NSArray *results;
@property (nonatomic,readwrite) NSString *error;

@end

@implementation RUJsonParser

+ (const NSString* __strong)getSupportedVersion
{
    return SUPPORTED_VERSION;
}

- (id)initWithData:(NSData*)data andError:(NSError**)error
{
    if( self = [super init]) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:error];
        if( json ) {
            [self parseRandomUserDictionary:json];
        }
        
    }
    return self;
}

#pragma mark - Internal
- (void)parseRandomUserDictionary:(NSDictionary*)dictionary
{
    NSArray *results = [dictionary objectForKey:@"results"];
    if( results ) {
        self.error = nil;
        self.results = [self parseResults:results];
    }
    else {
        self.error = [dictionary objectForKey:@"error"];
    }
}

- (NSArray*)parseResults:(NSArray*)results
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for( NSDictionary *dictionary in results ) {
        [array addObject:[self parseResult:dictionary]];
    }
    
    return array;
}

- (RUResult*)parseResult:(NSDictionary*)result
{
    NSString *seed = [result objectForKey:@"seed"];
    RUUser *user = [self parseUser:[result objectForKey:@"user"]];
    return [[RUResult alloc]initWithUser:user forSeed:seed];
}

- (RUUser*)parseUser:(NSDictionary*)user
{
    NSString *version = [user objectForKey:@"version"];
    if( version && [[RUJsonParser getSupportedVersion] isEqualToString:version]) {
        RUName *name = [self parseName:[user objectForKey:@"name"]];
        RUPicture *picture = [self parsePicture:[user objectForKey:@"picture"]];
        RULocation *location = [self parseLocation:[user objectForKey:@"location"]];
        
        return [[RUUser alloc]initWithName:name withLocation:location withEmail:[user objectForKey:@"email"]  withPhoneNumber:[user objectForKey:@"phone"] withCellNumber:[user objectForKey:@"cell"] withPicture:picture];
    }
    return nil;
}

- (RUName*)parseName:(NSDictionary*)name
{
    return [[RUName alloc]initWithFirstName:[name objectForKey:@"first"] withTitle:[name objectForKey:@"title"] withLastName:[name objectForKey:@"last"]];
}

- (RUPicture*)parsePicture:(NSDictionary*)picture
{
    return [[RUPicture alloc]initWithLargePictureUrl:[NSURL URLWithString:[picture objectForKey:@"large"]] withMediumPictureUrl:[NSURL URLWithString:[picture objectForKey:@"medium"]] withThumbnailUrl:[NSURL URLWithString:[picture objectForKey:@"thumbnail"]]];
}

- (RULocation*)parseLocation:(NSDictionary*)location
{
    return [[RULocation alloc] initWithStreet:[location objectForKey:@"street"] withCity:[location objectForKey:@"city"] withState:[location objectForKey:@"state"] withZip:[location objectForKey:@"zip"]];
}

@end
