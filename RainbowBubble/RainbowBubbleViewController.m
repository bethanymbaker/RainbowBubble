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
@property (strong, nonatomic) IBOutlet ColorButton *backgroundButton;
@property (strong, nonatomic) IBOutlet ColorButton *bubblesButton;
@property (strong, nonatomic) IBOutlet ColorButton *explosionButton;
@property (strong, nonatomic) IBOutlet ColorButton *clearButton;
@property (strong, nonatomic) RainbowBubbleView *rainbowBubbleView;
@end

@implementation RainbowBubbleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)loadView
{
    [super loadView];
    self.rainbowBubbleView = [[RainbowBubbleView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.view addSubview:self.rainbowBubbleView];
    
    // Add colorful buttons
    self.backgroundButton = [[ColorButton alloc]initWithFrame:CGRectMake(5, 5, 20, 20) title:@"backgroundButton"];
    [self.backgroundButton addTarget:self.rainbowBubbleView action:@selector(changeBackgroundColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backgroundButton];
    
    self.bubblesButton = [[ColorButton alloc]initWithFrame:CGRectOffset(self.backgroundButton.frame, 0, 40) title:@"bubblesButton"];
    [self.bubblesButton addTarget:self.rainbowBubbleView action:@selector(changeBubbleColors) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bubblesButton];
    
    /*
    self.explosionButton = [[ColorButton alloc]initWithFrame:CGRectOffset(self.backgroundButton.frame, 0, 80) title:@"explosionButton"];
    [self.explosionButton addTarget:self.rainbowBubbleView action:@selector(bubbleExplosion) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.explosionButton];
     */
    
    self.clearButton = [[ColorButton alloc]initWithFrame:CGRectOffset(self.backgroundButton.frame, 0, 80) title:@"clearButton"];
    [self.clearButton addTarget:self.rainbowBubbleView action:@selector(clearBubbles) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clearButton];
    
    // Seed random number for bubble generation
    srand48(time(0));
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
