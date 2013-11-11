//
//  RainbowBubbleViewController.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/8/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "RainbowBubbleViewController.h"

#import "RainbowBubbleView.h"

@interface RainbowBubbleViewController ()

@end

@implementation RainbowBubbleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    RainbowBubbleView *rainbowBubbleView = [[RainbowBubbleView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [rainbowBubbleView animate];
    self.view = rainbowBubbleView;
    
    // Seed random number for bubble generation
    srand48(time(0));
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
