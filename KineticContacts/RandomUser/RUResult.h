
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>

@class RUUser;

@interface RUResult : NSObject

- (id)initWithUser:(RUUser*)user forSeed:(NSString*)seed;


@property (nonatomic,readonly) NSString *seed;
@property (nonatomic,readonly) RUUser *user;

@end
