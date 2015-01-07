//
//  RandomUserPicture.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "RUPicture.h"

@interface RUPicture()
@property (nonatomic,readwrite) NSURL *largePictureUrl;
@property (nonatomic,readwrite) NSURL *mediumPictureUrl;
@property (nonatomic,readwrite) NSURL *thumbnailPictureUrl;
@end

@implementation RUPicture

- (id)initWithLargePictureUrl:(NSURL*)largePictureUrl withMediumPictureUrl:(NSURL*)mediumPictureUrl withThumbnailUrl:(NSURL*)thumbnailPictureUrl
{
    if( self = [super init]) {
        self.largePictureUrl = largePictureUrl;
        self.mediumPictureUrl = mediumPictureUrl;
        self.thumbnailPictureUrl = thumbnailPictureUrl;
    }
    return self;
}

@end
