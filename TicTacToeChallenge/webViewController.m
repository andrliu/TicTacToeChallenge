//
//  webViewController.m
//  TicTacToeChallenge
//
//  Created by Andrew Liu on 10/24/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Tic-tac-toe"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
