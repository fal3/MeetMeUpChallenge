//
//  DetailViewController.m
//  MeetMeUpChallenge
//
//  Created by alex fallah on 5/26/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"
@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rsvpCount;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameLabel.text = [self.event objectForKey:@"name"];
    self.descriptionLabel.text = [self.event objectForKey:@"description"];
    self.cityLabel.text = [[self.event objectForKey:@"venue"] objectForKey:@"address_1"];

    self.rsvpCount.text = [[self.event objectForKey:@"yes_rsvp_count"]stringValue];
    self.stateLabel.text = [[self.event objectForKey:@"venue"]objectForKey:@"country"];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *dvc = segue.destinationViewController;
    dvc.url = [NSURL URLWithString:[self.event objectForKey:@"event_url"]];
}

@end
