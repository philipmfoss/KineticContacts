//  Created by Philip Foss on 2015-01-07.


#import <Foundation/Foundation.h>

@protocol KCImageCacheTaskDelegate <NSObject>

- (void) loadedImage:(UIImage*)image forUrl:(NSURL*)url;

@end
