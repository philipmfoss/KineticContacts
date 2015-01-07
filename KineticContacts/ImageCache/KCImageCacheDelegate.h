//  Created by Philip Foss on 2015-01-06.

#import <Foundation/Foundation.h>

// Delegate protocol for KCImageCache.
// Users of KCImageCache should implement this protocol.
@protocol KCImageCacheDelegate <NSObject>

// Passes back an image for a given URL on successful download.
// User can call getImage on KCImageCache to retrieve the image at the URL.
- (void)loadedImage:(UIImage*)image forUrl:(NSURL*)url;

// Called when cleared method executes successfully.
- (void)cleared;

@end
