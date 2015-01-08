
//  Created by Philip Foss on 2015-01-06.

#import "KCImageCache.h"

@interface KCImageCache () {
    NSMutableDictionary *_images;
    NSMutableArray *_downloadQueue;
    dispatch_queue_t _queue;;
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
        _downloadQueue = [[NSMutableArray alloc]init];
        _queue = dispatch_queue_create("KCImageCacheQueue", NULL);
        
    }
    return self;
}

- (UIImage*)getImageForUrl:(NSURL*)url
{
    @synchronized(self)
    {
        return [_images objectForKey:url];
    }
}

- (void)setImage:(UIImage*)image forUrl:(NSURL*)url
{
    @synchronized(self)
    {
        [_images setObject:image forKey:url];
    }
}

- (void)loadImageForUrl:(NSURL*)url
{
    if( [self isUrlQueued:url] ) {
        return;
    }
    
    [_downloadQueue addObject:url];
    
    dispatch_async(_queue, ^{
        @autoreleasepool {
            if( ![self isUrlQueued:url] ) {
                return;
            }
            NSData *data = [NSData dataWithContentsOfURL:url];
            if( data ) {
                UIImage *image = [UIImage imageWithData:data];
                if( image ) {
                    [self loadedImage:image forUrl:url];
                }
            }
        }
    });
    
}

- (void)clear
{
    [_images removeAllObjects];
    [_downloadQueue removeAllObjects];
}

#pragma mark - Internal

- (BOOL)isUrlQueued:(NSURL*)url
{
    @synchronized(self) {
        return [_downloadQueue containsObject:url];
    }
}

- (void) loadedImage:(UIImage*)image forUrl:(NSURL*)url
{
    @synchronized(self)
    {
        [_downloadQueue removeObject:url];
    }
    
    [self setImage:image forUrl:url];

    if( self.delegate ) {
        [self.delegate loadedImage:image forUrl:url];
    }
}

@end
