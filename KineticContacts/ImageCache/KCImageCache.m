//
//  KCImageCache.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-06.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "KCImageCache.h"

@interface KCImageCache () {
    NSMutableDictionary *_images;
}
@end

static KCImageCache *_sharedInstance = nil;

@implementation KCImageCache

@synthesize delegate;

+ (KCImageCache*)sharedInstance
{
    if( !_sharedInstance ) {
        _sharedInstance = [[KCImageCache alloc]init];
    }
    
    return _sharedInstance;
}

- (id)init
{
    if( self = [super init]) {
        _images = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (UIImage*)getImageForUrl:(NSURL*)url
{
    return [_images objectForKey:url];
}

- (void)loadImageForUrl:(NSURL*)url
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            NSData *data = [NSData dataWithContentsOfURL:url];
            if( data ) {
                UIImage *image = [UIImage imageWithData:data];
                if( image ) {
                    [_images setObject:image forKey:url];
                    if( self.delegate ) {
                        [self.delegate loadedImage:image forUrl:url];
                    }
                }
            }
        }
    });
    
    
}

- (void)clear
{
    [_images removeAllObjects];
}
@end
