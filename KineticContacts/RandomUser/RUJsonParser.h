
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>

@interface RUJsonParser : NSObject

+ (const NSString* __strong)getSupportedVersion;

- (id)initWithData:(NSData*)data andError:(NSError**)error;

@property (nonatomic,readonly) NSArray *results;
@property (nonatomic,readonly) NSString *error;


@end
