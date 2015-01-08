
//  Created by Philip Foss on 2015-01-05.


#import <UIKit/UIKit.h>
#import "KCImageCacheDelegate.h"

@class RUResult;
@class KCImageCache;

@interface KCDetailViewController : UIViewController <KCImageCacheDelegate>

@property (strong, nonatomic) RUResult *detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *addressinfo;
@property (weak, nonatomic) IBOutlet UILabel *contactinfo;
@property (nonatomic) KCImageCache *imagecache;

@end
