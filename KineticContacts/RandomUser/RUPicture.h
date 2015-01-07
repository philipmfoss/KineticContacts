//
//  RUPicture.hs
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RUPicture : NSObject

- (id)initWithLargePictureUrl:(NSURL*)largePictureUrl withMediumPictureUrl:(NSURL*)mediumPictureUrl withThumbnailUrl:(NSURL*)thumbnailPictureUrl;

@property (nonatomic,readonly) NSURL *largePictureUrl;
@property (nonatomic,readonly) NSURL *mediumPictureUrl;
@property (nonatomic,readonly) NSURL *thumbnailPictureUrl;

@end
