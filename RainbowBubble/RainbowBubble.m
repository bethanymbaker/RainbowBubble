//
//  RainbowBubble.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/8/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "RainbowBubble.h"

@interface RainbowBubble()
@property (nonatomic) float xCoord;
@property (nonatomic) float yCoord;
@property (nonatomic) float dx;
@property (nonatomic) float dy;
@property (nonatomic) float height;
@property (nonatomic) float width;
@property (nonatomic) CGRect viewFrame;
@property (nonatomic) CGRect frame;
@property (strong, nonatomic) UIColor *color;

@end

@implementation RainbowBubble

- (id)initWithLocationOfTouch:(CGPoint)locationOfTouch andViewFrame:(CGRect)viewFrame;
{
    self = [super init];
    if (self) {
        
        self.viewFrame = viewFrame;
        if (YES) {
            self.width = 40.0*(float)rand() / RAND_MAX + 10.0;
            self.height = self.width;
        } else {
            self.width = 40.0*(float)rand() / RAND_MAX + 10.0;
            self.height = 40.0*(float)rand() / RAND_MAX + 10.0;
        }
        self.xCoord = locationOfTouch.x;
        self.yCoord = locationOfTouch.y;
        self.frame = CGRectMake(self.xCoord, self.yCoord, self.width, self.height);
        
        UIColor * color = [UIColor colorWithRed:(float)rand() / RAND_MAX
                                          green:(float)rand() / RAND_MAX
                                           blue:(float)rand() / RAND_MAX
                                          alpha:(float)rand() / RAND_MAX];
        self.color = color;
        self.dx = 10.0*(float)rand() / RAND_MAX - 5.0;
        self.dy = 10.0*(float)rand() / RAND_MAX - 5.0;
        
    }
    if (CGRectContainsRect(self.viewFrame, self.frame)) {
        return self;
    } else {
        return nil;
    }
}
- (void)drawBubble
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextStrokeEllipseInRect(context, self.frame);
    CGContextFillEllipseInRect(context, self.frame);
}
- (void)moveBubble;
{
    // Check that bubble is within the viewFrame
    if (CGRectContainsRect(self.viewFrame,CGRectMake(self.xCoord+self.dx, self.yCoord, self.width+self.dx, self.height))==FALSE) {
        self.dx = -self.dx;
    }
    if (CGRectContainsRect(self.viewFrame,CGRectMake(self.xCoord, self.yCoord+self.dy, self.width, self.height+self.dy))==FALSE) {
        self.dy = -self.dy;
    }
    
    // Move bubble
    self.xCoord += self.dx;
    self.yCoord += self.dy;
    self.frame = CGRectMake(self.xCoord, self.yCoord, self.width, self.height);
}

@end
