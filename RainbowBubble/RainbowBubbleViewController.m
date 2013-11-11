//
//  RainbowBubbleViewController.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/8/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "RainbowBubbleViewController.h"
#import "RainbowBubbleView.h"
#import "BackgroundColorButton.h"

@interface RainbowBubbleViewController ()
@property (weak, nonatomic) IBOutlet UIButton *mosaicButton;
@end

@implementation RainbowBubbleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    RainbowBubbleView *rainbowBubbleView = [[RainbowBubbleView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [rainbowBubbleView animate];
    self.view = rainbowBubbleView;
    
    // Make button to change background color
    self.mosaicButton = [BackgroundColorButton buttonWithType:UIButtonTypeCustom];
    self.mosaicButton.frame = CGRectMake(5, 5, 20, 20);
    [self.mosaicButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.mosaicButton];

    
    // Seed random number for bubble generation
    srand48(time(0));
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buttonPressed:(UIButton *)sender
{
    if ([self.view.backgroundColor isEqual:[UIColor grayColor]]) {
        self.view.backgroundColor = [UIColor whiteColor];
    } else if ([self.view.backgroundColor isEqual:[UIColor whiteColor]]) {
        self.view.backgroundColor = [UIColor blackColor];
    } else {
        self.view.backgroundColor = [UIColor grayColor];
    }
    
}

@end
