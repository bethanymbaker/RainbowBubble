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
@property (nonatomic) int numberOfBubbles;
@property (nonatomic) CGPoint locationOfTouch;
@property (nonatomic) NSTimer *bubbleTimer;
@property (strong, nonatomic) UILongPressGestureRecognizer *longPress;
@end

@implementation RainbowBubbleView
- (void)bubbleExplosion
{
    for (int i = 0; i<10; i++) {
        [self makeBubble];
    }
}
- (void)changeBackgroundColor
{
    if ([self.backgroundColor isEqual:[UIColor grayColor]]) {
        self.backgroundColor = [UIColor blackColor];
    } else if ([self.backgroundColor isEqual:[UIColor blackColor]]){
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor grayColor];
    }
}
- (void)clearBubbles
{
    [self.rainbowBubbles removeAllObjects];
}
- (void)changeBubbleColors
{
    for (RainbowBubble *bubble in self.rainbowBubbles) {
        [bubble changeColor];
    }
}
- (void)animate
{
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self selector:@selector(animate) userInfo:NULL repeats:NO];
    [self moveBubbles];
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
        self.backgroundColor = [UIColor blackColor];
        _rainbowBubbles = [[NSMutableArray alloc]init];
        _numberOfBubbles = 1;
        _locationOfTouch = CGPointMake(0.0, 0.0);
        _longPress = [[UILongPressGestureRecognizer alloc]
                                                   initWithTarget:self
                                                   action:@selector(handleLongPress:)];
        _longPress.minimumPressDuration = 0.25;
        [self addGestureRecognizer:_longPress];

        [self animate];
    }
    return self;
}
-  (void)handleLongPress:(UILongPressGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self.bubbleTimer invalidate];
    }
    else if (sender.state == UIGestureRecognizerStateBegan){
        [self makeBubbles];
    }
}
- (void)drawRect:(CGRect)rect
{
    [self drawBubbles];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.locationOfTouch = [[touches anyObject] locationInView:self];
    [self makeBubble];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];    
}
- (void)makeBubbles
{
    self.bubbleTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/7.5 target:self selector:@selector(makeBubbles) userInfo:NULL repeats:NO];
    [self makeBubble];
}
- (void)makeBubble
{
    RainbowBubble *rainbowBubble = [[RainbowBubble alloc]initWithLocationOfTouch:self.locationOfTouch andViewFrame:self.frame];
    if (rainbowBubble) {
        [self.rainbowBubbles addObject:rainbowBubble];
    }
    [self setNeedsDisplay];
}
@end
