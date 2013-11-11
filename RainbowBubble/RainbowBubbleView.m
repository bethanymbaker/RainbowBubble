//
//  RainbowBubbleView.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/8/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "RainbowBubbleView.h"
#import "RainbowBubble.h"

@interface RainbowBubbleView ()
@property (nonatomic) NSMutableArray *rainbowBubbles;
@end

@implementation RainbowBubbleView

- (void)animate
{
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self selector:@selector(animate) userInfo:NULL repeats:NO];
    [self setNeedsDisplay];
}

- (void)drawBubbles
{
    for (RainbowBubble *bubble in self.rainbowBubbles) {
        [bubble drawBubble];
    }
}

- (void)moveBubbles
{
    for (RainbowBubble *bubble in self.rainbowBubbles) {
        [bubble moveBubble];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = YES;
        self.backgroundColor = [UIColor grayColor];
        self.rainbowBubbles = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawBubbles];
    [self moveBubbles];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    RainbowBubble *rainbowBubble = [[RainbowBubble alloc]initWithLocationOfTouch:[touch locationInView:self]andViewFrame:self.frame];
    if (rainbowBubble) {
        [self.rainbowBubbles addObject:rainbowBubble];
    }
}
@end
