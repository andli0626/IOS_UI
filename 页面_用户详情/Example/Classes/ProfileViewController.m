// ProfileViewController.m
//
// Copyright (c) 2010 Mattt Thompson
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy 
// of this software and associated documentation files (the "Software"), to deal 
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
// copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
// SOFTWARE.

#import <QuartzCore/QuartzCore.h>
#import "ProfileViewController.h"
#import "TTTQuadrantControl.h"

enum {
	InformationSectionIndex,
} ProfileSectionIndicies;

enum {
	BioRowIndex,
	LocationRowIndex,
	WebsiteRowIndex,
} InformationSectionRowIndicies;

@implementation ProfileViewController
@synthesize avatarImageView = _avatarImageView;
@synthesize nameLabel = _nameLabel;
@synthesize twitterUsernameLabel = _twitterUsernameLabel;
@synthesize twitterUserIDLabel = _twitterUserIDLabel;
@synthesize quadrantControl = _quadrantControl;

- (id)init {
    self = [super initWithNibName:@"Profile" bundle:nil];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (void)dealloc {
    [_avatarImageView release];
    [_nameLabel release];
    [_twitterUsernameLabel release];
    [_twitterUserIDLabel release];
	[_quadrantControl release];
    [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 44.0f;
	
	self.avatarImageView.layer.cornerRadius = 8.0f;
	self.avatarImageView.layer.borderWidth = 1.0f;
	self.avatarImageView.layer.masksToBounds = YES;
	self.avatarImageView.layer.borderColor = [[UIColor clearColor] CGColor];
		
    self.quadrantControl.delegate = self;
	
	[self.quadrantControl setNumber:[NSNumber numberWithInt:190]
                            caption:@"following"
                             action:@selector(didSelectFollowingQuadrant)
                        forLocation:TopLeftLocation];
	
	[self.quadrantControl setNumber:[NSNumber numberWithInt:2969]
                            caption:@"tweets" 
                             action:@selector(didSelectTweetsQuadrant)
                        forLocation:TopRightLocation];
	
	[self.quadrantControl setNumber:[NSNumber numberWithInt:1013] 
                            caption:@"followers" 
                             action:@selector(didSelectFollowersQuadrant)
                        forLocation:BottomLeftLocation];
	
	[self.quadrantControl setNumber:[NSNumber numberWithInt:115] 
                            caption:@"listed" 
                             action:@selector(didSelectListedQuadrant)
                        forLocation:BottomRightLocation];	
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    _avatarImageView = nil;
    _nameLabel = nil;
    _twitterUsernameLabel = nil;
    _twitterUserIDLabel = nil;
    _quadrantControl = nil;
}

#pragma mark - Actions

- (void)didSelectFollowingQuadrant {
	NSLog(@"Following");
}

- (void)didSelectTweetsQuadrant {
	NSLog(@"Tweets");
}

- (void)didSelectFollowersQuadrant {
	NSLog(@"Followers");
}

- (void)didSelectListedQuadrant {
	NSLog(@"Listed");
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case BioRowIndex:
            return 77.0f;
        default:
            return tableView.rowHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = nil;
	
	switch (indexPath.row) {
		case BioRowIndex:
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
										   reuseIdentifier:nil] autorelease];
			cell.textLabel.text = NSLocalizedString(@"Hacker from the Rustbelt, living in Austin, TX. iOS Developer at @gowalla, and co-founder of @austinrb", nil);
			cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.numberOfLines = 0;
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			break;
		case LocationRowIndex:
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 
										   reuseIdentifier:nil] autorelease];
			cell.textLabel.text = NSLocalizedString(@"location", nil);
			cell.detailTextLabel.text = NSLocalizedString(@"Austin, TX", nil);
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			break;
		case WebsiteRowIndex:
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 
										   reuseIdentifier:nil] autorelease];
			cell.textLabel.text = @"web";
			cell.detailTextLabel.text = @"http://mattt.me";
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			break;
	}
	
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

