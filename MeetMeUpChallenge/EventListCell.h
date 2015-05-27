//
//  EventListCell.h
//  MeetMeUpChallenge
//
//  Created by alex fallah on 5/26/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *eventTitle;
@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UITextView *eventDescription;



@end
