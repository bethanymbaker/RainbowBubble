//
//  RainbowBubble.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/8/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "RainbowBubble.h"

@interface RainbowBubble()
@property (nonatomic) float dx;
@property (nonatomic) float dy;
@property (nonatomic) float height;
@property (nonatomic) float width;
@property (nonatomic) CGRect viewFrame;
@property (nonatomic) CGRect frame;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) UIColor *outlineColor;

@end

@implementation RainbowBubble

- (void)changeColor
{
    self.color = [UIColor colorWithRed:(float)drand48()
                                 green:(float)drand48()
                                  blue:(float)drand48()
                                 alpha:(float)drand48()];
    self.outlineColor = [UIColor colorWithRed:(float)drand48()
                                 green:(float)drand48()
                                  blue:(float)drand48()
                                 alpha:(float)drand48()];
    
}
- (id)initWithLocationOfTouch:(CGPoint)locationOfTouch andViewFrame:(CGRect)viewFrame;
{
    self = [super init];
    if (self) {
        
        self.viewFrame = viewFrame;
        if (YES) {
            self.width = 40.0*(float)drand48() + 10.0;
            self.height = self.width;
        } else {
            self.width = 40.0*(float)drand48() + 10.0;
            self.height = 40.0*(float)drand48() + 10.0;
        }
        self.frame = CGRectMake(locationOfTouch.x, locationOfTouch.y, self.width, self.height);
        
        self.color = [UIColor colorWithRed:(float)drand48()
                                          green:(float)drand48()
                                           blue:(float)drand48()
                                          alpha:(float)drand48()];
        self.outlineColor = [UIColor colorWithRed:(float)drand48()
                                     green:(float)drand48()
                                      blue:(float)drand48()
                                     alpha:(float)drand48()];
        self.dx = 10.0*(float)drand48() - 5.0;
        self.dy = 10.0*(float)drand48() - 5.0;
        
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
    //CGContextSetFillColorWithColor(context, self.outlineColor.CGColor);
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextStrokeEllipseInRect(context, self.frame);
    CGContextFillEllipseInRect(context, self.frame);
}
- (void)moveBubble;
{
    // Check that bubble is within the viewFrame and move the bubble
    if (CGRectContainsRect(self.viewFrame,CGRectOffset(self.frame, self.dx, 0.0))==FALSE) {
        self.dx = -self.dx;
    }
    if (CGRectContainsRect(self.viewFrame,CGRectOffset(self.frame, 0.0, self.dy))==FALSE) {
        self.dy = -self.dy;
    }
    self.frame = CGRectOffset(self.frame, self.dx, self.dy);
}

@end
