//  Created by Philip Foss on 2015-01-06.

#import <Foundation/Foundation.h>

@protocol KCImageCacheDelegate <NSObject>

- (void)loadedImage:(UIImage*)image forUrl:(NSURL*)url;
- (void)cleared;

@end
