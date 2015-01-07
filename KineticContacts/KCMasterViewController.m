//
//  KCMasterViewController.m
//  KineticContacts
//
//  Created by Philip Foss on 2015-01-05.
//  Copyright (c) 2015 GoGo Bits. All rights reserved.
//

#import "KCMasterViewController.h"
#import "KCDetailViewController.h"
#import "KCRandomUserCell.h"
#import "KCImageCache.h"

const u_int RANDOMUSER_COUNT = 100;

@interface KCMasterViewController () {
    NSArray *_results;
}
@end

@implementation KCMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.detailViewController = (KCDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [KCImageCache sharedInstance].delegate = self;

    _results = [[NSArray alloc]init];
    [[[RUApi alloc]init] getRandomUsers:RANDOMUSER_COUNT withDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[KCImageCache sharedInstance] clear];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	KCRandomUserCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"RandomUserCell"];
	RUResult *result = [_results objectAtIndex:indexPath.row];

    NSString *capitalizedFirstName = [KCMasterViewController capitalize:result.user.name.firstName];
    NSString *capitalizedLastName = [KCMasterViewController capitalize:result.user.name.lastName];
    NSString *name = [NSString stringWithFormat:NSLocalizedString(@"name_format", nil), capitalizedLastName, capitalizedFirstName];
    cell.name.text = name;
    
    UIImage *thumbnail = [[KCImageCache sharedInstance] getImageForUrl:result.user.picture.thumbnailPictureUrl];
    if( thumbnail ) {
        cell.thumbnailView.image = thumbnail;
    }
    else {
        cell.thumbnailView.image = nil;
        [[KCImageCache sharedInstance] loadImageForUrl:result.user.picture.thumbnailPictureUrl];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        RUResult *object = _results[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RUResult *object = _results[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - RUApiDelegate

- (void)didGetRandomUserResults:(NSArray*)results
{
    _results = results;
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (void)failedGetRandomUserResponseWithError:(NSError*)error;
{
    [self performSelectorOnMainThread:@selector(showError:) withObject:error.localizedDescription waitUntilDone:NO];
}

- (void)failedGetRandomUserResponseWithApiError:(NSString*)error
{
    [self performSelectorOnMainThread:@selector(showError:) withObject:error waitUntilDone:NO];
}


#pragma mark - KCImageCacheDelegate

- (void)loadedImage:(UIImage*)image forUrl:(NSURL*)url
{
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (void)cleared
{
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

#pragma mark - Internal

- (void)showError:(NSString*)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"server_error", nil)
                                                    message:error
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"ok", nil)
                                          otherButtonTitles:nil];
    [alert show];

}

+ (NSString*)capitalize:(NSString*)word
{
    return [[[word substringToIndex:1] uppercaseString] stringByAppendingString:[word substringFromIndex:1]];
    
}


@end
