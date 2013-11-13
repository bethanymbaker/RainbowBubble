//
//  ColorButton.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/11/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "ColorButton.h"

@implementation ColorButton

+ (ColorButton *)buttonWithType:(UIButtonType)type
{
    return [super buttonWithType:UIButtonTypeCustom];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *redColor = [UIColor redColor];
    UIColor *orangeColor = [UIColor orangeColor];
    UIColor *yellowColor = [UIColor yellowColor];
    UIColor *greenColor = [UIColor greenColor];
    UIColor *blueColor = [UIColor blueColor];
    
    if ([self.currentTitle isEqual:@"backgroundButton"]) {
        CGContextSetFillColorWithColor(context, redColor.CGColor);
        CGContextFillRect(context,CGRectMake(0, 0, 10, 10));
        
        CGContextSetFillColorWithColor(context, orangeColor.CGColor);
        CGContextFillRect(context,CGRectMake(10, 0, 10, 10));
        
        CGContextSetFillColorWithColor(context, greenColor.CGColor);
        CGContextFillRect(context,CGRectMake(0, 10, 10, 10));
        
        CGContextSetFillColorWithColor(context, yellowColor.CGColor);
        CGContextFillRect(context,CGRectMake(10, 10, 10, 10));
    } else if ([self.currentTitle isEqual:@"bubblesButton"]) {
        CGContextSetFillColorWithColor(context, redColor.CGColor);
        CGContextFillRect(context,CGRectMake(0, 0, 20, 4));
        
        CGContextSetFillColorWithColor(context, orangeColor.CGColor);
        CGContextFillRect(context,CGRectMake(0, 4, 20, 4));
        
        CGContextSetFillColorWithColor(context, yellowColor.CGColor);
        CGContextFillRect(context,CGRectMake(0, 8, 20, 4));
        
        CGContextSetFillColorWithColor(context, greenColor.CGColor);
        CGContextFillRect(context,CGRectMake(0, 12, 20, 4));
        
        CGContextSetFillColorWithColor(context, blueColor.CGColor);
        CGContextFillRect(context,CGRectMake(0, 16, 20, 4));
    } else if ([self.currentTitle isEqual:@"clearButton"]) {
        //CGContextSetFillColorWithColor(context, redColor.CGColor);
        //CGContextFillRect(context, CGRectMake(0, 0, 20, 20));
        
        CGContextSetStrokeColorWithColor(context, redColor.CGColor);
        CGContextStrokeRect(context, CGRectMake(0, 0, 20, 20));
        
    }

}

@end
