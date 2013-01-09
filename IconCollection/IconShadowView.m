//
//  IconShadowView.m
//  IconCollection
//
//  Created by Nate West on 1/4/13.
//  Copyright (c) 2013 Nate West. All rights reserved.
//

#import "IconShadowView.h"

@implementation IconShadowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect
{
    //NSString *letters = @"abcdefghijklmnop";
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShadow(context, CGSizeMake(4.0f, 4.0f), 3.0f);
    [self.iconsLabel.text drawInRect:self.frame withFont:[UIFont fontWithName:@"iconmoon" size:80.0f]];
    
    
    //[letters drawAtPoint:CGPointMake(5.0f, 5.0f) withFont:[UIFont fontWithName:@"icomoon" size:80.0f]];
    
}

@end
