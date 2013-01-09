//
//  IconLabel.m
//  IconCollection
//
//  Created by Nate West on 1/4/13.
//  Copyright (c) 2013 Nate West. All rights reserved.
//

#import "IconLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation IconLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.shadowColor = [[UIColor greenColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
        self.layer.shadowOpacity = 1.0f;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *shadowColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000];
    
    CGContextSetShadowWithColor(context, CGSizeMake(2.0f, 2.0f), 2.0f, [shadowColor CGColor]);
    [self drawTextInRect:self.frame];
}
 */

@end
