//
//  KCMasterViewController.h
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RUApi.h"
#import "KCImageCacheDelegate.h"

@class KCDetailViewController;

@interface KCMasterViewController : UITableViewController <RUApiDelegate, KCImageCacheDelegate>

+ (NSString*)capitalize:(NSString*)word;

@property (strong, nonatomic) KCDetailViewController *detailViewController;

@end
