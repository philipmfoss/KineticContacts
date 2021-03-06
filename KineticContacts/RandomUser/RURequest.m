
//  Created by Philip Foss on 2015-01-06.


#import "RURequest.h"
#import "RUJsonParser.h"

const NSString *RANDOMUSER_DOMAIN = @"http://api.randomuser.me";

@interface RURequest()
@property (nonatomic,readwrite) NSInteger result;
@property (nonatomic,readwrite) NSString *seed;
@property (nonatomic,readwrite) RUGender gender;
@end

@implementation RURequest

- (id)initWithResults:(NSInteger)result
{
    if( self = [super init]) {
        self.result = result;
        self.gender = RUGENDER_UNSPECIFIED;
        self.seed = nil;
    }
    return self;
}

- (id)initWithSeed:(NSString*)seed withGender:(RUGender)gender withResult:(NSInteger)result
{
    if( self = [super init]) {
        self.result = result;
        self.gender = gender;
        self.seed = seed;
    }
    return self;
}

- (NSURL*)getUrl
{
    NSString *path = [NSString stringWithFormat:@"%@/%@/?results=%ld", RANDOMUSER_DOMAIN, [RUJsonParser getSupportedVersion], (long)self.result];
    
        switch(self.gender) {
        case RUGENDER_MALE:
            path = [path stringByAppendingString:@"&gender=male"];
            break;
        case RUGENDER_FEMALE:
            path = [path stringByAppendingString:@"&gender=female"];
            break;
        default:
            break;
    }
    
    if( self.seed ) {
        path = [path stringByAppendingString:@"&seed="];
        path = [path stringByAppendingString:self.seed];
    }
    
    return [NSURL URLWithString:path];
}

@end
