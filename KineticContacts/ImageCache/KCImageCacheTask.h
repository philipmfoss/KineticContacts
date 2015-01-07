
//  Created by Philip Foss on 2015-01-07.

#import <Foundation/Foundation.h>
#import "KCImageCacheTaskDelegate.h"

@interface KCImageCacheTask : NSObject

- (id)initWithUrl:(NSURL*)url;
- (void)execute;
- (BOOL)isRunning;

@property (nonatomic,readonly) NSURL *url;
@property (nonatomic, weak) id<KCImageCacheTaskDelegate> delegate;

@end
