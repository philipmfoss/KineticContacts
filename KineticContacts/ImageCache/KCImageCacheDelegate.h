//
//  KCImageCacheDelegate.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KCImageCacheDelegate <NSObject>

- (void)loadedImage:(UIImage*)image forUrl:(NSURL*)url;
- (void)cleared;

@end
