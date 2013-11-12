//
//  RainbowBubble.h
//  RainbowBubble
//
//  Created by Bethany Simmons on 11/8/13.
//  Copyright (c) 2013 Bethany Simmons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RainbowBubble : NSObject
- (id)initWithLocationOfTouch:(CGPoint)locationOfTouch andViewFrame:(CGRect)viewFrame;
- (void)drawBubble;
- (void)moveBubble;
- (void)changeColor;
@end
