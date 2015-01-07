
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>

@interface RUName : NSObject

- (id)initWithFirstName:(NSString*)firstName withTitle:(NSString*)title withLastName:(NSString*)lastName;

@property (nonatomic,readonly) NSString *firstName;
@property (nonatomic,readonly) NSString *title;
@property (nonatomic,readonly) NSString *lastName;

@end
