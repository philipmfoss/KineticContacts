//
//  KCImageCacheTask.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-07.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "KCImageCacheTask.h"

@interface KCImageCacheTask()
{
    BOOL _running;
}
@property (nonatomic,readwrite) NSURL *url;
@end

@implementation KCImageCacheTask

- (id)initWithUrl:(NSURL*)url
{
    if( self = [super init]) {
        self.url = url;
    }
    return self;
}

- (void)execute
{
    if( ![self isRunning] ) {
        
        @synchronized(self) {
            _running = YES;
            NSData *data = [NSData dataWithContentsOfURL:self.url];
            if( data ) {
                UIImage *image = [UIImage imageWithData:data];
                if( image ) {
                    if( self.delegate ) {
                        [self.delegate loadedImage:image forUrl:self.url];
                    }
                }
            }
        }
    }
}

- (BOOL)isRunning
{
    @synchronized(self) {
        return _running;
    }
}

@end
