//
//  KCImageCache.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCImageCacheDelegate.h"
#import "KCImageCacheTaskDelegate.h"

@interface KCImageCache : NSObject <KCImageCacheTaskDelegate>

+ (KCImageCache*)sharedInstance;

- (UIImage*)getImageForUrl:(NSURL*)url;
- (void)setImage:(UIImage*)image forUrl:(NSURL*)url;
- (void)loadImageForUrl:(NSURL*)url;
- (void)clear;

@property (nonatomic,weak) id<KCImageCacheDelegate> delegate;

@end
