//
//  WebViewController.m
//  MeetMeUpChallenge
//
//  Created by alex fallah on 5/26/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController 
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}

//- (IBAction)onDismissTapped:(UIButton *)sender{
//    [self.view.hidden = YES ];
//}
//
//

@end
