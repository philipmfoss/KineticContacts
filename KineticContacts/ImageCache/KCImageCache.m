
//  Created by Philip Foss on 2015-01-06.

#import "KCImageCache.h"
#import "KCImageCacheTask.h"

@interface KCImageCache () {
    NSMutableDictionary *_images;
    NSMutableDictionary *_downloadQueue;
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
        _downloadQueue = [[NSMutableDictionary alloc]init];
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
    @synchronized(self)
    {
        KCImageCacheTask *task = [_downloadQueue objectForKey:url];
        if( task ) {
            return;
        }
        
        task = [[KCImageCacheTask alloc]initWithUrl:url];
        task.delegate = self;
        [_downloadQueue setObject:task forKey:url];
    
        __block NSDictionary *queueSnapshot = [NSDictionary dictionaryWithDictionary:_downloadQueue];

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @autoreleasepool {
                for( NSURL *key in queueSnapshot ) {
                    KCImageCacheTask *task = [queueSnapshot objectForKey:key];
                    [task execute];
                }
            }
        });
    }
    
}

- (void)clear
{
    [_images removeAllObjects];
    [_downloadQueue removeAllObjects];
}

#pragma mark - KCImageCacheTaskDelegate

- (void) loadedImage:(UIImage*)image forUrl:(NSURL*)url
{
    @synchronized(self)
    {
        [_downloadQueue removeObjectForKey:url];
    }
    
    [self setImage:image forUrl:url];

    if( self.delegate ) {
        [self.delegate loadedImage:image forUrl:url];
    }
}

@end
