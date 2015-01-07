
//  Created by Philip Foss on 2015-01-06.

#import <Foundation/Foundation.h>
#import "KCImageCacheDelegate.h"
#import "KCImageCacheTaskDelegate.h"

@interface KCImageCache : NSObject <KCImageCacheTaskDelegate>

+ (KCImageCache*)sharedInstance;

// If this returns nil, call loadImageForUrl and wait for the delegate, then call this again.
- (UIImage*)getImageForUrl:(NSURL*)url;

// Asynchronous methor to download an image and add it to the cache.
// Calls delegate when complete.
- (void)loadImageForUrl:(NSURL*)url;

// Clears the cached images.
// Call this on low memory conditions.
- (void)clear;

@property (nonatomic,weak) id<KCImageCacheDelegate> delegate;

@end
