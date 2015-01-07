
//  Created by Philip Foss on 2015-01-05.


#import "RUUser.h"
#import "RUName.h"
#import "RULocation.h"
#import "RUPicture.h"

@interface RUUser()

@property (nonatomic,readwrite) RUName *name;
@property (nonatomic,readwrite) RULocation *location;
@property (nonatomic,readwrite) NSString *email;
@property (nonatomic,readwrite) NSString *phoneNumber;
@property (nonatomic,readwrite) NSString *cellNumber;
@property (nonatomic,readwrite) RUPicture *picture;

@end

@implementation RUUser

- (id)initWithName:(RUName*)name
            withLocation:(RULocation*)location
            withEmail:(NSString*)email
            withPhoneNumber:(NSString*)phoneNumber
            withCellNumber:(NSString*)cellNumber
            withPicture:(RUPicture*)picture
{
    if( self = [super init]) {
        self.name = name;
        self.location = location;
        self.email = email;
        self.phoneNumber = phoneNumber;
        self.cellNumber = cellNumber;
        self.picture = picture;
    }
    return self;
}

@end
