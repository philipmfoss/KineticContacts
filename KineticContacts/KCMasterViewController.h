
//  Created by Philip Foss on 2015-01-05.


#import <UIKit/UIKit.h>
#import "KCImageCacheDelegate.h"
#import "RUApi.h"

@class KCDetailViewController;

@interface KCMasterViewController : UITableViewController <RUApiDelegate, KCImageCacheDelegate>

+ (NSString*)capitalize:(NSString*)word;

@property (nonatomic) KCDetailViewController *detailViewController;

@end
