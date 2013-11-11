//
//  BackgroundColorButton.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/11/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "BackgroundColorButton.h"

@implementation BackgroundColorButton

+ (BackgroundColorButton *)buttonWithType:(UIButtonType)type
{
    return [super buttonWithType:UIButtonTypeCustom];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *redColor = [UIColor redColor];
    UIColor *orangeColor = [UIColor orangeColor];
    UIColor *greenColor = [UIColor greenColor];
    UIColor *yellowColor = [UIColor yellowColor];
    
    CGContextSetFillColorWithColor(context, redColor.CGColor);
    CGContextFillRect(context,CGRectMake(0, 0, 10, 10));
    
    CGContextSetFillColorWithColor(context, orangeColor.CGColor);
    CGContextFillRect(context,CGRectMake(10, 0, 10, 10));
    
    CGContextSetFillColorWithColor(context, greenColor.CGColor);
    CGContextFillRect(context,CGRectMake(0, 10, 10, 10));
    
    CGContextSetFillColorWithColor(context, yellowColor.CGColor);
    CGContextFillRect(context,CGRectMake(10, 10, 10, 10));

}

@end
