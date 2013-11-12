//
//  RainbowBubbleViewController.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/8/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "RainbowBubbleViewController.h"
#import "RainbowBubbleView.h"
#import "ColorButton.h"

@interface RainbowBubbleViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backgroundButton;
@property (weak, nonatomic) IBOutlet UIButton *bubblesButton;
@property (strong, nonatomic) RainbowBubbleView *rainbowBubbleView;
@end

@implementation RainbowBubbleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.rainbowBubbleView = [[RainbowBubbleView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.rainbowBubbleView animate];
    [self.view addSubview:self.rainbowBubbleView];
     
    // Make button to change background color
    self.backgroundButton = [ColorButton buttonWithType:UIButtonTypeCustom];
    self.backgroundButton.frame = CGRectMake(5, 5, 20, 20);
    [self.backgroundButton setTitle:@"backgroundButton" forState:UIControlStateNormal];
    [self.backgroundButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backgroundButton];
    
    // Make button to change color of bubbles
    self.bubblesButton = [ColorButton buttonWithType:UIButtonTypeCustom];
    self.bubblesButton.frame = CGRectOffset(self.backgroundButton.frame, 0, 40);
    [self.bubblesButton setTitle:@"bubblesButton" forState:UIControlStateNormal];
    [self.bubblesButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bubblesButton];
    
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
    if ([sender isEqual:self.backgroundButton]) {
        if ([self.rainbowBubbleView.backgroundColor isEqual:[UIColor grayColor]]) {
            self.rainbowBubbleView.backgroundColor = [UIColor whiteColor];
        } else if ([self.rainbowBubbleView.backgroundColor isEqual:[UIColor whiteColor]]) {
            self.rainbowBubbleView.backgroundColor = [UIColor blackColor];
        } else {
            self.rainbowBubbleView.backgroundColor = [UIColor grayColor];
        }
    } else if ([sender isEqual:self.bubblesButton]) {
        [self.rainbowBubbleView changeBubbleColors];
    }
    
}

@end
