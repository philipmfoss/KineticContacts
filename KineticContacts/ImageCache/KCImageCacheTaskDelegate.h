//
//  KCImageCacheTaskDelegate.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-07.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KCImageCacheTaskDelegate <NSObject>

- (void) loadedImage:(UIImage*)image forUrl:(NSURL*)url;

@end
