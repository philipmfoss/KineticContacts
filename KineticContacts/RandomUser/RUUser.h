
//  Created by Philip Foss on 2015-01-05.


#import <Foundation/Foundation.h>

@class RUName;
@class RULocation;
@class RUPicture;

@interface RUUser : NSObject

- (id)initWithName:(RUName*)name
        withLocation:(RULocation*)location
           withEmail:(NSString*)email
     withPhoneNumber:(NSString*)phoneNumber
      withCellNumber:(NSString*)cellNumber
         withPicture:(RUPicture*)picture;


@property (nonatomic,readonly) RUName *name;
@property (nonatomic,readonly) RULocation *location;
@property (nonatomic,readonly) NSString *email;
@property (nonatomic,readonly) NSString *phoneNumber;
@property (nonatomic,readonly) NSString *cellNumber;
@property (nonatomic,readonly) RUPicture *picture;

@end
