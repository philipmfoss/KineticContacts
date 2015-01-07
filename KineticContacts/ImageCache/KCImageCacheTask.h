//
//  KCImageCacheTask.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-07.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCImageCacheTaskDelegate.h"

@interface KCImageCacheTask : NSObject

- (id)initWithUrl:(NSURL*)url;
- (void)execute;
- (BOOL)isRunning;

@property (nonatomic,readonly) NSURL *url;
@property (nonatomic, weak) id<KCImageCacheTaskDelegate> delegate;

@end
