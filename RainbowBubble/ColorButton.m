//
//  ColorButton.m
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/11/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import "ColorButton.h"

@interface ColorButton()
@property (nonatomic) NSString *title;
@end

@implementation ColorButton

+ (ColorButton *)buttonWithType:(UIButtonType)type
{
    return [super buttonWithType:UIButtonTypeCustom];
}
- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    [self setTitle:title forState:UIControlStateNormal];
    return self;
}
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
        CGContextSetStrokeColorWithColor(context, redColor.CGColor);
        //CGContextStrokeRect(context, CGRectMake(0, 0, 20, 20));
        CGContextStrokeRectWithWidth(context, CGRectMake(0, 0, 20, 20), 3);
        
    } else if ([self.currentTitle isEqual:@"explosionButton"]){
        CGContextSetFillColorWithColor(context, redColor.CGColor);
        CGContextFillEllipseInRect(context, CGRectMake(0, 0, 10, 10));
        CGContextSetFillColorWithColor(context, orangeColor.CGColor);
        CGContextFillEllipseInRect(context, CGRectMake(10, 0, 10, 10));
        CGContextSetFillColorWithColor(context, yellowColor.CGColor);
        CGContextFillEllipseInRect(context, CGRectMake(0, 10, 10, 10));
        CGContextSetFillColorWithColor(context, greenColor.CGColor);
        CGContextFillEllipseInRect(context, CGRectMake(10, 10, 10, 10));
    }
}
@end
