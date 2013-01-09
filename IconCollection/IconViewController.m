//
//  IconCollectionViewController.m
//  IconCollection
//
//  Created by Nate West on 1/4/13.
//  Copyright (c) 2013 Nate West. All rights reserved.
//

#import "IconViewController.h"
#import "IconShadowView.h"

@interface IconViewController ()

@end

@implementation IconViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.icons.font = [UIFont fontWithName:@"icomoon" size:80.0f];
    self.icons.textColor = [UIColor colorWithHue:0.583 saturation:1.000 brightness:0.502 alpha:1.000];
    self.icons.shadowColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:0.500];
    self.icons.shadowOffset = CGSizeMake(1.5f, 1.5f);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
