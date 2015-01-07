//
//  KCDetailViewController.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "KCDetailViewController.h"
#import "KCImageCache.h"
#import "RUApi.h"

@interface KCDetailViewController ()


@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;

@end

@implementation KCDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    if (self.detailItem) {
        NSString *capitalizedTitle = [KCDetailViewController capitalize:self.detailItem.user.name.title];
        NSString *capitalizedFirstName = [KCDetailViewController capitalize:self.detailItem.user.name.firstName];
        NSString *capitalizedLastName = [KCDetailViewController capitalize:self.detailItem.user.name.lastName];
        NSString *formattedname = [NSString stringWithFormat:NSLocalizedString(@"detailed_name_format", nil), capitalizedTitle, capitalizedFirstName, capitalizedLastName];
        self.name.text = formattedname;
        
        NSString *formattedaddress = [NSString stringWithFormat:NSLocalizedString(@"address_format", nil), self.detailItem.user.location.street, self.detailItem.user.location.city, self.detailItem.user.location.state, self.detailItem.user.location.zip];
        self.addressinfo.text = [formattedaddress uppercaseString];

        NSString *formattedcontactinfo = @"";
        if( self.detailItem.user.phoneNumber && self.detailItem.user.phoneNumber.length > 0 ) {
            formattedcontactinfo = [formattedcontactinfo stringByAppendingString:[NSString stringWithFormat:NSLocalizedString(@"phone_format", nil), self.detailItem.user.phoneNumber]];
        }
        if( self.detailItem.user.cellNumber && self.detailItem.user.cellNumber.length > 0 ) {
            formattedcontactinfo = [formattedcontactinfo stringByAppendingString:[NSString stringWithFormat:NSLocalizedString(@"cell_format", nil), self.detailItem.user.cellNumber]];
        }
        if( self.detailItem.user.email && self.detailItem.user.email.length > 0 ) {
            formattedcontactinfo = [formattedcontactinfo stringByAppendingString:[NSString stringWithFormat:NSLocalizedString(@"email_format", nil), self.detailItem.user.email]];
        }
        self.contactinfo.text = formattedcontactinfo;

        UIImage *thumbnail = [[KCImageCache sharedInstance] getImageForUrl:self.detailItem.user.picture.largePictureUrl];
        if( thumbnail ) {
            self.picture.image = thumbnail;
        }
        else {
            [[KCImageCache sharedInstance] loadImageForUrl:self.detailItem.user.picture.largePictureUrl];
        }
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[KCImageCache sharedInstance].delegate = self;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[KCImageCache sharedInstance] clear];
}

#pragma mark - KCImageCacheDelegate

- (void)loadedImage:(UIImage*)image forUrl:(NSURL*)url
{
    [self performSelectorOnMainThread:@selector(configureView) withObject:nil waitUntilDone:NO];
}

- (void)cleared
{
    [self performSelectorOnMainThread:@selector(configureView) withObject:nil waitUntilDone:NO];
}

#pragma mark - Internal

+ (NSString*)capitalize:(NSString*)word
{
    return [[[word substringToIndex:1] uppercaseString] stringByAppendingString:[word substringFromIndex:1]];
    
}

@end
