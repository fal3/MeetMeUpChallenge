//
//  CommentViewController.m
//  MeetMeUpChallenge
//
//  Created by alex fallah on 5/26/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSURL *url = [NSURL URLWithString:@"]
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"";
    cell.detailTextLabel.text = @"";
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


@end
