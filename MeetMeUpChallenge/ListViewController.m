//
//  ViewController.m
//  MeetMeUpChallenge
//
//  Created by alex fallah on 5/26/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "ListViewController.h"
#import "EventListCell.h"
#import "DetailViewController.h"
#import "CommentViewController.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSString *searchWord;


@property NSArray *comments;
@property NSArray *events;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //grab the json data
    self.searchWord = @"mobile";

    [self searchNewData];

//    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=1871425f41d45764b77e6327c36"];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.events.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *event = [self.events objectAtIndex:indexPath.row];

    EventListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.eventTitle.text = [event objectForKey:@"name"];
    cell.eventDescription.text =  [event objectForKey:@"description"];
//    cell.eventDescription.text = @"HIIIII";
    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDictionary *event = [self.events objectAtIndex:indexPath.row];
    if ([segue.identifier isEqualToString:@"CommentsSegue"])
    {
        CommentViewController *cvc = segue.destinationViewController;
    
    } else if ([segue.identifier isEqualToString:@"WebSegue"])
    {

        DetailViewController *dvc = segue.destinationViewController;
        dvc.event = event;
    }
   

}


#pragma mark Content Filtering
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    self.searchWord = self.searchBar.text;
    [self searchNewData];
}




-(void)searchNewData{
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"https://api.meetup.com/2/open_events.json?zip=60604&text=%@&time=,1w&key=1871425f41d45764b77e6327c36", self.searchWord]];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         //download data
         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

         //array of 31 dictionaries
         self.events = [dictionary objectForKey:@"results"];

         [self.tableView reloadData];
     }];

}


@end
