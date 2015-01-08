
//  Created by Philip Foss on 2015-01-06.

#import "KCImageCache.h"
#import "KCImageCacheTask.h"

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
    @synchronized(self)
    {
        
        if( [_downloadQueue containsObject:url] ) {
            return;
        }
        
        KCImageCacheTask *task = [[KCImageCacheTask alloc]initWithUrl:url];
        task.delegate = self;
        [_downloadQueue addObject:url];
        
        dispatch_async(_queue, ^{
            @autoreleasepool {
                [task execute];
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
        [_downloadQueue removeObject:url];
    }
    
    [self setImage:image forUrl:url];

    if( self.delegate ) {
        [self.delegate loadedImage:image forUrl:url];
    }
}

@end
